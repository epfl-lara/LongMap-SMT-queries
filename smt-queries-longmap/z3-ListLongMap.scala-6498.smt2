; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82810 () Bool)

(assert start!82810)

(declare-fun b_free!18955 () Bool)

(declare-fun b_next!18955 () Bool)

(assert (=> start!82810 (= b_free!18955 (not b_next!18955))))

(declare-fun tp!65995 () Bool)

(declare-fun b_and!30417 () Bool)

(assert (=> start!82810 (= tp!65995 b_and!30417)))

(declare-fun mapIsEmpty!34639 () Bool)

(declare-fun mapRes!34639 () Bool)

(assert (=> mapIsEmpty!34639 mapRes!34639))

(declare-fun b!965970 () Bool)

(declare-fun e!544526 () Bool)

(assert (=> b!965970 (= e!544526 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!431072 () Bool)

(declare-datatypes ((V!34001 0))(
  ( (V!34002 (val!10932 Int)) )
))
(declare-datatypes ((ValueCell!10400 0))(
  ( (ValueCellFull!10400 (v!13489 V!34001)) (EmptyCell!10400) )
))
(declare-datatypes ((array!59538 0))(
  ( (array!59539 (arr!28638 (Array (_ BitVec 32) ValueCell!10400)) (size!29119 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59538)

(declare-datatypes ((array!59540 0))(
  ( (array!59541 (arr!28639 (Array (_ BitVec 32) (_ BitVec 64))) (size!29120 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59540)

(declare-fun minValue!1342 () V!34001)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34001)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14132 0))(
  ( (tuple2!14133 (_1!7077 (_ BitVec 64)) (_2!7077 V!34001)) )
))
(declare-datatypes ((List!19935 0))(
  ( (Nil!19932) (Cons!19931 (h!21093 tuple2!14132) (t!28289 List!19935)) )
))
(declare-datatypes ((ListLongMap!12819 0))(
  ( (ListLongMap!12820 (toList!6425 List!19935)) )
))
(declare-fun contains!5470 (ListLongMap!12819 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3587 (array!59540 array!59538 (_ BitVec 32) (_ BitVec 32) V!34001 V!34001 (_ BitVec 32) Int) ListLongMap!12819)

(assert (=> b!965970 (= lt!431072 (contains!5470 (getCurrentListMap!3587 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28639 _keys!1686) i!803)))))

(declare-fun b!965971 () Bool)

(declare-fun res!646638 () Bool)

(assert (=> b!965971 (=> (not res!646638) (not e!544526))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965971 (= res!646638 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29120 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29120 _keys!1686))))))

(declare-fun b!965972 () Bool)

(declare-fun res!646641 () Bool)

(assert (=> b!965972 (=> (not res!646641) (not e!544526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965972 (= res!646641 (validKeyInArray!0 (select (arr!28639 _keys!1686) i!803)))))

(declare-fun b!965973 () Bool)

(declare-fun e!544528 () Bool)

(declare-fun tp_is_empty!21763 () Bool)

(assert (=> b!965973 (= e!544528 tp_is_empty!21763)))

(declare-fun b!965974 () Bool)

(declare-fun res!646643 () Bool)

(assert (=> b!965974 (=> (not res!646643) (not e!544526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59540 (_ BitVec 32)) Bool)

(assert (=> b!965974 (= res!646643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965975 () Bool)

(declare-fun res!646642 () Bool)

(assert (=> b!965975 (=> (not res!646642) (not e!544526))))

(assert (=> b!965975 (= res!646642 (and (= (size!29119 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29120 _keys!1686) (size!29119 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34639 () Bool)

(declare-fun tp!65994 () Bool)

(assert (=> mapNonEmpty!34639 (= mapRes!34639 (and tp!65994 e!544528))))

(declare-fun mapValue!34639 () ValueCell!10400)

(declare-fun mapRest!34639 () (Array (_ BitVec 32) ValueCell!10400))

(declare-fun mapKey!34639 () (_ BitVec 32))

(assert (=> mapNonEmpty!34639 (= (arr!28638 _values!1400) (store mapRest!34639 mapKey!34639 mapValue!34639))))

(declare-fun b!965976 () Bool)

(declare-fun res!646639 () Bool)

(assert (=> b!965976 (=> (not res!646639) (not e!544526))))

(declare-datatypes ((List!19936 0))(
  ( (Nil!19933) (Cons!19932 (h!21094 (_ BitVec 64)) (t!28290 List!19936)) )
))
(declare-fun arrayNoDuplicates!0 (array!59540 (_ BitVec 32) List!19936) Bool)

(assert (=> b!965976 (= res!646639 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19933))))

(declare-fun res!646640 () Bool)

(assert (=> start!82810 (=> (not res!646640) (not e!544526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82810 (= res!646640 (validMask!0 mask!2110))))

(assert (=> start!82810 e!544526))

(assert (=> start!82810 true))

(declare-fun e!544527 () Bool)

(declare-fun array_inv!22235 (array!59538) Bool)

(assert (=> start!82810 (and (array_inv!22235 _values!1400) e!544527)))

(declare-fun array_inv!22236 (array!59540) Bool)

(assert (=> start!82810 (array_inv!22236 _keys!1686)))

(assert (=> start!82810 tp!65995))

(assert (=> start!82810 tp_is_empty!21763))

(declare-fun b!965977 () Bool)

(declare-fun e!544525 () Bool)

(assert (=> b!965977 (= e!544527 (and e!544525 mapRes!34639))))

(declare-fun condMapEmpty!34639 () Bool)

(declare-fun mapDefault!34639 () ValueCell!10400)

(assert (=> b!965977 (= condMapEmpty!34639 (= (arr!28638 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10400)) mapDefault!34639)))))

(declare-fun b!965978 () Bool)

(assert (=> b!965978 (= e!544525 tp_is_empty!21763)))

(assert (= (and start!82810 res!646640) b!965975))

(assert (= (and b!965975 res!646642) b!965974))

(assert (= (and b!965974 res!646643) b!965976))

(assert (= (and b!965976 res!646639) b!965971))

(assert (= (and b!965971 res!646638) b!965972))

(assert (= (and b!965972 res!646641) b!965970))

(assert (= (and b!965977 condMapEmpty!34639) mapIsEmpty!34639))

(assert (= (and b!965977 (not condMapEmpty!34639)) mapNonEmpty!34639))

(get-info :version)

(assert (= (and mapNonEmpty!34639 ((_ is ValueCellFull!10400) mapValue!34639)) b!965973))

(assert (= (and b!965977 ((_ is ValueCellFull!10400) mapDefault!34639)) b!965978))

(assert (= start!82810 b!965977))

(declare-fun m!894301 () Bool)

(assert (=> mapNonEmpty!34639 m!894301))

(declare-fun m!894303 () Bool)

(assert (=> b!965976 m!894303))

(declare-fun m!894305 () Bool)

(assert (=> b!965974 m!894305))

(declare-fun m!894307 () Bool)

(assert (=> start!82810 m!894307))

(declare-fun m!894309 () Bool)

(assert (=> start!82810 m!894309))

(declare-fun m!894311 () Bool)

(assert (=> start!82810 m!894311))

(declare-fun m!894313 () Bool)

(assert (=> b!965972 m!894313))

(assert (=> b!965972 m!894313))

(declare-fun m!894315 () Bool)

(assert (=> b!965972 m!894315))

(declare-fun m!894317 () Bool)

(assert (=> b!965970 m!894317))

(assert (=> b!965970 m!894313))

(assert (=> b!965970 m!894317))

(assert (=> b!965970 m!894313))

(declare-fun m!894319 () Bool)

(assert (=> b!965970 m!894319))

(check-sat (not b_next!18955) (not start!82810) b_and!30417 (not mapNonEmpty!34639) (not b!965972) tp_is_empty!21763 (not b!965976) (not b!965970) (not b!965974))
(check-sat b_and!30417 (not b_next!18955))
