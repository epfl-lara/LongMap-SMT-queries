; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82866 () Bool)

(assert start!82866)

(declare-fun b_free!18993 () Bool)

(declare-fun b_next!18993 () Bool)

(assert (=> start!82866 (= b_free!18993 (not b_next!18993))))

(declare-fun tp!66108 () Bool)

(declare-fun b_and!30481 () Bool)

(assert (=> start!82866 (= tp!66108 b_and!30481)))

(declare-fun mapNonEmpty!34696 () Bool)

(declare-fun mapRes!34696 () Bool)

(declare-fun tp!66107 () Bool)

(declare-fun e!544961 () Bool)

(assert (=> mapNonEmpty!34696 (= mapRes!34696 (and tp!66107 e!544961))))

(declare-datatypes ((V!34051 0))(
  ( (V!34052 (val!10951 Int)) )
))
(declare-datatypes ((ValueCell!10419 0))(
  ( (ValueCellFull!10419 (v!13509 V!34051)) (EmptyCell!10419) )
))
(declare-fun mapValue!34696 () ValueCell!10419)

(declare-datatypes ((array!59679 0))(
  ( (array!59680 (arr!28708 (Array (_ BitVec 32) ValueCell!10419)) (size!29187 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59679)

(declare-fun mapKey!34696 () (_ BitVec 32))

(declare-fun mapRest!34696 () (Array (_ BitVec 32) ValueCell!10419))

(assert (=> mapNonEmpty!34696 (= (arr!28708 _values!1400) (store mapRest!34696 mapKey!34696 mapValue!34696))))

(declare-fun b!966731 () Bool)

(declare-fun e!544957 () Bool)

(declare-fun tp_is_empty!21801 () Bool)

(assert (=> b!966731 (= e!544957 tp_is_empty!21801)))

(declare-fun b!966732 () Bool)

(declare-fun e!544959 () Bool)

(assert (=> b!966732 (= e!544959 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59681 0))(
  ( (array!59682 (arr!28709 (Array (_ BitVec 32) (_ BitVec 64))) (size!29188 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59681)

(declare-fun minValue!1342 () V!34051)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun lt!431356 () Bool)

(declare-fun zeroValue!1342 () V!34051)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14084 0))(
  ( (tuple2!14085 (_1!7053 (_ BitVec 64)) (_2!7053 V!34051)) )
))
(declare-datatypes ((List!19929 0))(
  ( (Nil!19926) (Cons!19925 (h!21087 tuple2!14084) (t!28292 List!19929)) )
))
(declare-datatypes ((ListLongMap!12781 0))(
  ( (ListLongMap!12782 (toList!6406 List!19929)) )
))
(declare-fun contains!5507 (ListLongMap!12781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3639 (array!59681 array!59679 (_ BitVec 32) (_ BitVec 32) V!34051 V!34051 (_ BitVec 32) Int) ListLongMap!12781)

(assert (=> b!966732 (= lt!431356 (contains!5507 (getCurrentListMap!3639 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28709 _keys!1686) i!803)))))

(declare-fun b!966733 () Bool)

(declare-fun res!647099 () Bool)

(assert (=> b!966733 (=> (not res!647099) (not e!544959))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966733 (= res!647099 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29188 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29188 _keys!1686))))))

(declare-fun b!966734 () Bool)

(declare-fun res!647103 () Bool)

(assert (=> b!966734 (=> (not res!647103) (not e!544959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966734 (= res!647103 (validKeyInArray!0 (select (arr!28709 _keys!1686) i!803)))))

(declare-fun b!966735 () Bool)

(declare-fun res!647101 () Bool)

(assert (=> b!966735 (=> (not res!647101) (not e!544959))))

(assert (=> b!966735 (= res!647101 (and (= (size!29187 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29188 _keys!1686) (size!29187 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34696 () Bool)

(assert (=> mapIsEmpty!34696 mapRes!34696))

(declare-fun b!966736 () Bool)

(declare-fun res!647102 () Bool)

(assert (=> b!966736 (=> (not res!647102) (not e!544959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59681 (_ BitVec 32)) Bool)

(assert (=> b!966736 (= res!647102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966737 () Bool)

(declare-fun e!544958 () Bool)

(assert (=> b!966737 (= e!544958 (and e!544957 mapRes!34696))))

(declare-fun condMapEmpty!34696 () Bool)

(declare-fun mapDefault!34696 () ValueCell!10419)

(assert (=> b!966737 (= condMapEmpty!34696 (= (arr!28708 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10419)) mapDefault!34696)))))

(declare-fun b!966739 () Bool)

(assert (=> b!966739 (= e!544961 tp_is_empty!21801)))

(declare-fun b!966738 () Bool)

(declare-fun res!647104 () Bool)

(assert (=> b!966738 (=> (not res!647104) (not e!544959))))

(declare-datatypes ((List!19930 0))(
  ( (Nil!19927) (Cons!19926 (h!21088 (_ BitVec 64)) (t!28293 List!19930)) )
))
(declare-fun arrayNoDuplicates!0 (array!59681 (_ BitVec 32) List!19930) Bool)

(assert (=> b!966738 (= res!647104 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19927))))

(declare-fun res!647100 () Bool)

(assert (=> start!82866 (=> (not res!647100) (not e!544959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82866 (= res!647100 (validMask!0 mask!2110))))

(assert (=> start!82866 e!544959))

(assert (=> start!82866 true))

(declare-fun array_inv!22235 (array!59679) Bool)

(assert (=> start!82866 (and (array_inv!22235 _values!1400) e!544958)))

(declare-fun array_inv!22236 (array!59681) Bool)

(assert (=> start!82866 (array_inv!22236 _keys!1686)))

(assert (=> start!82866 tp!66108))

(assert (=> start!82866 tp_is_empty!21801))

(assert (= (and start!82866 res!647100) b!966735))

(assert (= (and b!966735 res!647101) b!966736))

(assert (= (and b!966736 res!647102) b!966738))

(assert (= (and b!966738 res!647104) b!966733))

(assert (= (and b!966733 res!647099) b!966734))

(assert (= (and b!966734 res!647103) b!966732))

(assert (= (and b!966737 condMapEmpty!34696) mapIsEmpty!34696))

(assert (= (and b!966737 (not condMapEmpty!34696)) mapNonEmpty!34696))

(get-info :version)

(assert (= (and mapNonEmpty!34696 ((_ is ValueCellFull!10419) mapValue!34696)) b!966739))

(assert (= (and b!966737 ((_ is ValueCellFull!10419) mapDefault!34696)) b!966731))

(assert (= start!82866 b!966737))

(declare-fun m!895439 () Bool)

(assert (=> b!966738 m!895439))

(declare-fun m!895441 () Bool)

(assert (=> b!966734 m!895441))

(assert (=> b!966734 m!895441))

(declare-fun m!895443 () Bool)

(assert (=> b!966734 m!895443))

(declare-fun m!895445 () Bool)

(assert (=> b!966736 m!895445))

(declare-fun m!895447 () Bool)

(assert (=> b!966732 m!895447))

(assert (=> b!966732 m!895441))

(assert (=> b!966732 m!895447))

(assert (=> b!966732 m!895441))

(declare-fun m!895449 () Bool)

(assert (=> b!966732 m!895449))

(declare-fun m!895451 () Bool)

(assert (=> start!82866 m!895451))

(declare-fun m!895453 () Bool)

(assert (=> start!82866 m!895453))

(declare-fun m!895455 () Bool)

(assert (=> start!82866 m!895455))

(declare-fun m!895457 () Bool)

(assert (=> mapNonEmpty!34696 m!895457))

(check-sat b_and!30481 (not b!966734) (not b_next!18993) (not b!966732) (not b!966736) tp_is_empty!21801 (not mapNonEmpty!34696) (not b!966738) (not start!82866))
(check-sat b_and!30481 (not b_next!18993))
