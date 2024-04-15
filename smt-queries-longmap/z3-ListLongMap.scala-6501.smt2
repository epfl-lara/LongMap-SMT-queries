; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82828 () Bool)

(assert start!82828)

(declare-fun b_free!18973 () Bool)

(declare-fun b_next!18973 () Bool)

(assert (=> start!82828 (= b_free!18973 (not b_next!18973))))

(declare-fun tp!66049 () Bool)

(declare-fun b_and!30435 () Bool)

(assert (=> start!82828 (= tp!66049 b_and!30435)))

(declare-fun mapNonEmpty!34666 () Bool)

(declare-fun mapRes!34666 () Bool)

(declare-fun tp!66048 () Bool)

(declare-fun e!544663 () Bool)

(assert (=> mapNonEmpty!34666 (= mapRes!34666 (and tp!66048 e!544663))))

(declare-datatypes ((V!34025 0))(
  ( (V!34026 (val!10941 Int)) )
))
(declare-datatypes ((ValueCell!10409 0))(
  ( (ValueCellFull!10409 (v!13498 V!34025)) (EmptyCell!10409) )
))
(declare-fun mapRest!34666 () (Array (_ BitVec 32) ValueCell!10409))

(declare-fun mapKey!34666 () (_ BitVec 32))

(declare-datatypes ((array!59572 0))(
  ( (array!59573 (arr!28655 (Array (_ BitVec 32) ValueCell!10409)) (size!29136 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59572)

(declare-fun mapValue!34666 () ValueCell!10409)

(assert (=> mapNonEmpty!34666 (= (arr!28655 _values!1400) (store mapRest!34666 mapKey!34666 mapValue!34666))))

(declare-fun b!966213 () Bool)

(declare-fun e!544661 () Bool)

(assert (=> b!966213 (= e!544661 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59574 0))(
  ( (array!59575 (arr!28656 (Array (_ BitVec 32) (_ BitVec 64))) (size!29137 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59574)

(declare-fun minValue!1342 () V!34025)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun lt!431099 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34025)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14142 0))(
  ( (tuple2!14143 (_1!7082 (_ BitVec 64)) (_2!7082 V!34025)) )
))
(declare-datatypes ((List!19947 0))(
  ( (Nil!19944) (Cons!19943 (h!21105 tuple2!14142) (t!28301 List!19947)) )
))
(declare-datatypes ((ListLongMap!12829 0))(
  ( (ListLongMap!12830 (toList!6430 List!19947)) )
))
(declare-fun contains!5475 (ListLongMap!12829 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3592 (array!59574 array!59572 (_ BitVec 32) (_ BitVec 32) V!34025 V!34025 (_ BitVec 32) Int) ListLongMap!12829)

(assert (=> b!966213 (= lt!431099 (contains!5475 (getCurrentListMap!3592 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28656 _keys!1686) i!803)))))

(declare-fun b!966214 () Bool)

(declare-fun res!646805 () Bool)

(assert (=> b!966214 (=> (not res!646805) (not e!544661))))

(declare-datatypes ((List!19948 0))(
  ( (Nil!19945) (Cons!19944 (h!21106 (_ BitVec 64)) (t!28302 List!19948)) )
))
(declare-fun arrayNoDuplicates!0 (array!59574 (_ BitVec 32) List!19948) Bool)

(assert (=> b!966214 (= res!646805 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19945))))

(declare-fun b!966215 () Bool)

(declare-fun res!646802 () Bool)

(assert (=> b!966215 (=> (not res!646802) (not e!544661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966215 (= res!646802 (validKeyInArray!0 (select (arr!28656 _keys!1686) i!803)))))

(declare-fun res!646800 () Bool)

(assert (=> start!82828 (=> (not res!646800) (not e!544661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82828 (= res!646800 (validMask!0 mask!2110))))

(assert (=> start!82828 e!544661))

(assert (=> start!82828 true))

(declare-fun e!544660 () Bool)

(declare-fun array_inv!22249 (array!59572) Bool)

(assert (=> start!82828 (and (array_inv!22249 _values!1400) e!544660)))

(declare-fun array_inv!22250 (array!59574) Bool)

(assert (=> start!82828 (array_inv!22250 _keys!1686)))

(assert (=> start!82828 tp!66049))

(declare-fun tp_is_empty!21781 () Bool)

(assert (=> start!82828 tp_is_empty!21781))

(declare-fun mapIsEmpty!34666 () Bool)

(assert (=> mapIsEmpty!34666 mapRes!34666))

(declare-fun b!966216 () Bool)

(declare-fun res!646804 () Bool)

(assert (=> b!966216 (=> (not res!646804) (not e!544661))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966216 (= res!646804 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29137 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29137 _keys!1686))))))

(declare-fun b!966217 () Bool)

(declare-fun res!646803 () Bool)

(assert (=> b!966217 (=> (not res!646803) (not e!544661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59574 (_ BitVec 32)) Bool)

(assert (=> b!966217 (= res!646803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966218 () Bool)

(declare-fun e!544662 () Bool)

(assert (=> b!966218 (= e!544660 (and e!544662 mapRes!34666))))

(declare-fun condMapEmpty!34666 () Bool)

(declare-fun mapDefault!34666 () ValueCell!10409)

(assert (=> b!966218 (= condMapEmpty!34666 (= (arr!28655 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10409)) mapDefault!34666)))))

(declare-fun b!966219 () Bool)

(assert (=> b!966219 (= e!544663 tp_is_empty!21781)))

(declare-fun b!966220 () Bool)

(assert (=> b!966220 (= e!544662 tp_is_empty!21781)))

(declare-fun b!966221 () Bool)

(declare-fun res!646801 () Bool)

(assert (=> b!966221 (=> (not res!646801) (not e!544661))))

(assert (=> b!966221 (= res!646801 (and (= (size!29136 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29137 _keys!1686) (size!29136 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82828 res!646800) b!966221))

(assert (= (and b!966221 res!646801) b!966217))

(assert (= (and b!966217 res!646803) b!966214))

(assert (= (and b!966214 res!646805) b!966216))

(assert (= (and b!966216 res!646804) b!966215))

(assert (= (and b!966215 res!646802) b!966213))

(assert (= (and b!966218 condMapEmpty!34666) mapIsEmpty!34666))

(assert (= (and b!966218 (not condMapEmpty!34666)) mapNonEmpty!34666))

(get-info :version)

(assert (= (and mapNonEmpty!34666 ((_ is ValueCellFull!10409) mapValue!34666)) b!966219))

(assert (= (and b!966218 ((_ is ValueCellFull!10409) mapDefault!34666)) b!966220))

(assert (= start!82828 b!966218))

(declare-fun m!894481 () Bool)

(assert (=> start!82828 m!894481))

(declare-fun m!894483 () Bool)

(assert (=> start!82828 m!894483))

(declare-fun m!894485 () Bool)

(assert (=> start!82828 m!894485))

(declare-fun m!894487 () Bool)

(assert (=> mapNonEmpty!34666 m!894487))

(declare-fun m!894489 () Bool)

(assert (=> b!966217 m!894489))

(declare-fun m!894491 () Bool)

(assert (=> b!966215 m!894491))

(assert (=> b!966215 m!894491))

(declare-fun m!894493 () Bool)

(assert (=> b!966215 m!894493))

(declare-fun m!894495 () Bool)

(assert (=> b!966214 m!894495))

(declare-fun m!894497 () Bool)

(assert (=> b!966213 m!894497))

(assert (=> b!966213 m!894491))

(assert (=> b!966213 m!894497))

(assert (=> b!966213 m!894491))

(declare-fun m!894499 () Bool)

(assert (=> b!966213 m!894499))

(check-sat (not b!966214) (not b_next!18973) (not b!966215) b_and!30435 (not b!966213) (not start!82828) tp_is_empty!21781 (not mapNonEmpty!34666) (not b!966217))
(check-sat b_and!30435 (not b_next!18973))
