; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82752 () Bool)

(assert start!82752)

(declare-fun b_free!18885 () Bool)

(declare-fun b_next!18885 () Bool)

(assert (=> start!82752 (= b_free!18885 (not b_next!18885))))

(declare-fun tp!65774 () Bool)

(declare-fun b_and!30373 () Bool)

(assert (=> start!82752 (= tp!65774 b_and!30373)))

(declare-fun b!965192 () Bool)

(declare-fun e!544106 () Bool)

(declare-fun e!544103 () Bool)

(declare-fun mapRes!34525 () Bool)

(assert (=> b!965192 (= e!544106 (and e!544103 mapRes!34525))))

(declare-fun condMapEmpty!34525 () Bool)

(declare-datatypes ((V!33899 0))(
  ( (V!33900 (val!10894 Int)) )
))
(declare-datatypes ((ValueCell!10362 0))(
  ( (ValueCellFull!10362 (v!13452 V!33899)) (EmptyCell!10362) )
))
(declare-datatypes ((array!59459 0))(
  ( (array!59460 (arr!28598 (Array (_ BitVec 32) ValueCell!10362)) (size!29077 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59459)

(declare-fun mapDefault!34525 () ValueCell!10362)

(assert (=> b!965192 (= condMapEmpty!34525 (= (arr!28598 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10362)) mapDefault!34525)))))

(declare-fun b!965193 () Bool)

(declare-fun res!646077 () Bool)

(declare-fun e!544104 () Bool)

(assert (=> b!965193 (=> (not res!646077) (not e!544104))))

(declare-datatypes ((array!59461 0))(
  ( (array!59462 (arr!28599 (Array (_ BitVec 32) (_ BitVec 64))) (size!29078 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59461)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965193 (= res!646077 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29078 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29078 _keys!1686))))))

(declare-fun mapNonEmpty!34525 () Bool)

(declare-fun tp!65775 () Bool)

(declare-fun e!544105 () Bool)

(assert (=> mapNonEmpty!34525 (= mapRes!34525 (and tp!65775 e!544105))))

(declare-fun mapRest!34525 () (Array (_ BitVec 32) ValueCell!10362))

(declare-fun mapKey!34525 () (_ BitVec 32))

(declare-fun mapValue!34525 () ValueCell!10362)

(assert (=> mapNonEmpty!34525 (= (arr!28598 _values!1400) (store mapRest!34525 mapKey!34525 mapValue!34525))))

(declare-fun b!965194 () Bool)

(declare-fun res!646078 () Bool)

(assert (=> b!965194 (=> (not res!646078) (not e!544104))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965194 (= res!646078 (and (= (size!29077 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29078 _keys!1686) (size!29077 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965195 () Bool)

(declare-fun tp_is_empty!21687 () Bool)

(assert (=> b!965195 (= e!544105 tp_is_empty!21687)))

(declare-fun b!965196 () Bool)

(declare-fun res!646075 () Bool)

(assert (=> b!965196 (=> (not res!646075) (not e!544104))))

(declare-datatypes ((List!19848 0))(
  ( (Nil!19845) (Cons!19844 (h!21006 (_ BitVec 64)) (t!28211 List!19848)) )
))
(declare-fun arrayNoDuplicates!0 (array!59461 (_ BitVec 32) List!19848) Bool)

(assert (=> b!965196 (= res!646075 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19845))))

(declare-fun b!965197 () Bool)

(declare-fun res!646074 () Bool)

(assert (=> b!965197 (=> (not res!646074) (not e!544104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59461 (_ BitVec 32)) Bool)

(assert (=> b!965197 (= res!646074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965198 () Bool)

(assert (=> b!965198 (= e!544104 false)))

(declare-fun lt!431212 () Bool)

(declare-fun minValue!1342 () V!33899)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33899)

(declare-datatypes ((tuple2!14004 0))(
  ( (tuple2!14005 (_1!7013 (_ BitVec 64)) (_2!7013 V!33899)) )
))
(declare-datatypes ((List!19849 0))(
  ( (Nil!19846) (Cons!19845 (h!21007 tuple2!14004) (t!28212 List!19849)) )
))
(declare-datatypes ((ListLongMap!12701 0))(
  ( (ListLongMap!12702 (toList!6366 List!19849)) )
))
(declare-fun contains!5469 (ListLongMap!12701 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3599 (array!59461 array!59459 (_ BitVec 32) (_ BitVec 32) V!33899 V!33899 (_ BitVec 32) Int) ListLongMap!12701)

(assert (=> b!965198 (= lt!431212 (contains!5469 (getCurrentListMap!3599 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28599 _keys!1686) i!803)))))

(declare-fun b!965199 () Bool)

(assert (=> b!965199 (= e!544103 tp_is_empty!21687)))

(declare-fun res!646073 () Bool)

(assert (=> start!82752 (=> (not res!646073) (not e!544104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82752 (= res!646073 (validMask!0 mask!2110))))

(assert (=> start!82752 e!544104))

(assert (=> start!82752 true))

(declare-fun array_inv!22147 (array!59459) Bool)

(assert (=> start!82752 (and (array_inv!22147 _values!1400) e!544106)))

(declare-fun array_inv!22148 (array!59461) Bool)

(assert (=> start!82752 (array_inv!22148 _keys!1686)))

(assert (=> start!82752 tp!65774))

(assert (=> start!82752 tp_is_empty!21687))

(declare-fun b!965200 () Bool)

(declare-fun res!646076 () Bool)

(assert (=> b!965200 (=> (not res!646076) (not e!544104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965200 (= res!646076 (validKeyInArray!0 (select (arr!28599 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34525 () Bool)

(assert (=> mapIsEmpty!34525 mapRes!34525))

(assert (= (and start!82752 res!646073) b!965194))

(assert (= (and b!965194 res!646078) b!965197))

(assert (= (and b!965197 res!646074) b!965196))

(assert (= (and b!965196 res!646075) b!965193))

(assert (= (and b!965193 res!646077) b!965200))

(assert (= (and b!965200 res!646076) b!965198))

(assert (= (and b!965192 condMapEmpty!34525) mapIsEmpty!34525))

(assert (= (and b!965192 (not condMapEmpty!34525)) mapNonEmpty!34525))

(get-info :version)

(assert (= (and mapNonEmpty!34525 ((_ is ValueCellFull!10362) mapValue!34525)) b!965195))

(assert (= (and b!965192 ((_ is ValueCellFull!10362) mapDefault!34525)) b!965199))

(assert (= start!82752 b!965192))

(declare-fun m!894329 () Bool)

(assert (=> start!82752 m!894329))

(declare-fun m!894331 () Bool)

(assert (=> start!82752 m!894331))

(declare-fun m!894333 () Bool)

(assert (=> start!82752 m!894333))

(declare-fun m!894335 () Bool)

(assert (=> b!965200 m!894335))

(assert (=> b!965200 m!894335))

(declare-fun m!894337 () Bool)

(assert (=> b!965200 m!894337))

(declare-fun m!894339 () Bool)

(assert (=> mapNonEmpty!34525 m!894339))

(declare-fun m!894341 () Bool)

(assert (=> b!965197 m!894341))

(declare-fun m!894343 () Bool)

(assert (=> b!965198 m!894343))

(assert (=> b!965198 m!894335))

(assert (=> b!965198 m!894343))

(assert (=> b!965198 m!894335))

(declare-fun m!894345 () Bool)

(assert (=> b!965198 m!894345))

(declare-fun m!894347 () Bool)

(assert (=> b!965196 m!894347))

(check-sat (not b!965198) (not b!965196) (not mapNonEmpty!34525) (not b!965197) (not b!965200) (not start!82752) tp_is_empty!21687 b_and!30373 (not b_next!18885))
(check-sat b_and!30373 (not b_next!18885))
