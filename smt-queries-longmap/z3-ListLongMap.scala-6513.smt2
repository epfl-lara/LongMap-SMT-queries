; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82900 () Bool)

(assert start!82900)

(declare-fun b_free!19045 () Bool)

(declare-fun b_next!19045 () Bool)

(assert (=> start!82900 (= b_free!19045 (not b_next!19045))))

(declare-fun tp!66264 () Bool)

(declare-fun b_and!30507 () Bool)

(assert (=> start!82900 (= tp!66264 b_and!30507)))

(declare-fun mapNonEmpty!34774 () Bool)

(declare-fun mapRes!34774 () Bool)

(declare-fun tp!66265 () Bool)

(declare-fun e!545203 () Bool)

(assert (=> mapNonEmpty!34774 (= mapRes!34774 (and tp!66265 e!545203))))

(declare-datatypes ((V!34121 0))(
  ( (V!34122 (val!10977 Int)) )
))
(declare-datatypes ((ValueCell!10445 0))(
  ( (ValueCellFull!10445 (v!13534 V!34121)) (EmptyCell!10445) )
))
(declare-datatypes ((array!59710 0))(
  ( (array!59711 (arr!28724 (Array (_ BitVec 32) ValueCell!10445)) (size!29205 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59710)

(declare-fun mapValue!34774 () ValueCell!10445)

(declare-fun mapRest!34774 () (Array (_ BitVec 32) ValueCell!10445))

(declare-fun mapKey!34774 () (_ BitVec 32))

(assert (=> mapNonEmpty!34774 (= (arr!28724 _values!1400) (store mapRest!34774 mapKey!34774 mapValue!34774))))

(declare-fun b!967342 () Bool)

(declare-fun e!545202 () Bool)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((array!59712 0))(
  ( (array!59713 (arr!28725 (Array (_ BitVec 32) (_ BitVec 64))) (size!29206 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59712)

(assert (=> b!967342 (= e!545202 (not (and (bvsge (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2084 #b00000000000000000000000000000001) (size!29206 _keys!1686)))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34121)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34121)

(declare-datatypes ((tuple2!14194 0))(
  ( (tuple2!14195 (_1!7108 (_ BitVec 64)) (_2!7108 V!34121)) )
))
(declare-datatypes ((List!19996 0))(
  ( (Nil!19993) (Cons!19992 (h!21154 tuple2!14194) (t!28350 List!19996)) )
))
(declare-datatypes ((ListLongMap!12881 0))(
  ( (ListLongMap!12882 (toList!6456 List!19996)) )
))
(declare-fun contains!5501 (ListLongMap!12881 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3618 (array!59712 array!59710 (_ BitVec 32) (_ BitVec 32) V!34121 V!34121 (_ BitVec 32) Int) ListLongMap!12881)

(assert (=> b!967342 (contains!5501 (getCurrentListMap!3618 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28725 _keys!1686) i!803))))

(declare-datatypes ((Unit!32204 0))(
  ( (Unit!32205) )
))
(declare-fun lt!431198 () Unit!32204)

(declare-fun lemmaInListMapFromThenInFromMinusOne!66 (array!59712 array!59710 (_ BitVec 32) (_ BitVec 32) V!34121 V!34121 (_ BitVec 32) (_ BitVec 32) Int) Unit!32204)

(assert (=> b!967342 (= lt!431198 (lemmaInListMapFromThenInFromMinusOne!66 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967343 () Bool)

(declare-fun e!545200 () Bool)

(declare-fun tp_is_empty!21853 () Bool)

(assert (=> b!967343 (= e!545200 tp_is_empty!21853)))

(declare-fun b!967344 () Bool)

(declare-fun res!647607 () Bool)

(assert (=> b!967344 (=> (not res!647607) (not e!545202))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967344 (= res!647607 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967345 () Bool)

(declare-fun res!647608 () Bool)

(assert (=> b!967345 (=> (not res!647608) (not e!545202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967345 (= res!647608 (validKeyInArray!0 (select (arr!28725 _keys!1686) i!803)))))

(declare-fun b!967346 () Bool)

(declare-fun res!647606 () Bool)

(assert (=> b!967346 (=> (not res!647606) (not e!545202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59712 (_ BitVec 32)) Bool)

(assert (=> b!967346 (= res!647606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!647610 () Bool)

(assert (=> start!82900 (=> (not res!647610) (not e!545202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82900 (= res!647610 (validMask!0 mask!2110))))

(assert (=> start!82900 e!545202))

(assert (=> start!82900 true))

(declare-fun e!545199 () Bool)

(declare-fun array_inv!22303 (array!59710) Bool)

(assert (=> start!82900 (and (array_inv!22303 _values!1400) e!545199)))

(declare-fun array_inv!22304 (array!59712) Bool)

(assert (=> start!82900 (array_inv!22304 _keys!1686)))

(assert (=> start!82900 tp!66264))

(assert (=> start!82900 tp_is_empty!21853))

(declare-fun b!967347 () Bool)

(declare-fun res!647611 () Bool)

(assert (=> b!967347 (=> (not res!647611) (not e!545202))))

(declare-datatypes ((List!19997 0))(
  ( (Nil!19994) (Cons!19993 (h!21155 (_ BitVec 64)) (t!28351 List!19997)) )
))
(declare-fun arrayNoDuplicates!0 (array!59712 (_ BitVec 32) List!19997) Bool)

(assert (=> b!967347 (= res!647611 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19994))))

(declare-fun b!967348 () Bool)

(declare-fun res!647612 () Bool)

(assert (=> b!967348 (=> (not res!647612) (not e!545202))))

(assert (=> b!967348 (= res!647612 (and (= (size!29205 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29206 _keys!1686) (size!29205 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967349 () Bool)

(assert (=> b!967349 (= e!545199 (and e!545200 mapRes!34774))))

(declare-fun condMapEmpty!34774 () Bool)

(declare-fun mapDefault!34774 () ValueCell!10445)

(assert (=> b!967349 (= condMapEmpty!34774 (= (arr!28724 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10445)) mapDefault!34774)))))

(declare-fun b!967350 () Bool)

(declare-fun res!647605 () Bool)

(assert (=> b!967350 (=> (not res!647605) (not e!545202))))

(assert (=> b!967350 (= res!647605 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29206 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29206 _keys!1686))))))

(declare-fun mapIsEmpty!34774 () Bool)

(assert (=> mapIsEmpty!34774 mapRes!34774))

(declare-fun b!967351 () Bool)

(declare-fun res!647609 () Bool)

(assert (=> b!967351 (=> (not res!647609) (not e!545202))))

(assert (=> b!967351 (= res!647609 (contains!5501 (getCurrentListMap!3618 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28725 _keys!1686) i!803)))))

(declare-fun b!967352 () Bool)

(assert (=> b!967352 (= e!545203 tp_is_empty!21853)))

(assert (= (and start!82900 res!647610) b!967348))

(assert (= (and b!967348 res!647612) b!967346))

(assert (= (and b!967346 res!647606) b!967347))

(assert (= (and b!967347 res!647611) b!967350))

(assert (= (and b!967350 res!647605) b!967345))

(assert (= (and b!967345 res!647608) b!967351))

(assert (= (and b!967351 res!647609) b!967344))

(assert (= (and b!967344 res!647607) b!967342))

(assert (= (and b!967349 condMapEmpty!34774) mapIsEmpty!34774))

(assert (= (and b!967349 (not condMapEmpty!34774)) mapNonEmpty!34774))

(get-info :version)

(assert (= (and mapNonEmpty!34774 ((_ is ValueCellFull!10445) mapValue!34774)) b!967352))

(assert (= (and b!967349 ((_ is ValueCellFull!10445) mapDefault!34774)) b!967343))

(assert (= start!82900 b!967349))

(declare-fun m!895345 () Bool)

(assert (=> b!967342 m!895345))

(declare-fun m!895347 () Bool)

(assert (=> b!967342 m!895347))

(assert (=> b!967342 m!895345))

(assert (=> b!967342 m!895347))

(declare-fun m!895349 () Bool)

(assert (=> b!967342 m!895349))

(declare-fun m!895351 () Bool)

(assert (=> b!967342 m!895351))

(assert (=> b!967345 m!895347))

(assert (=> b!967345 m!895347))

(declare-fun m!895353 () Bool)

(assert (=> b!967345 m!895353))

(declare-fun m!895355 () Bool)

(assert (=> b!967347 m!895355))

(declare-fun m!895357 () Bool)

(assert (=> start!82900 m!895357))

(declare-fun m!895359 () Bool)

(assert (=> start!82900 m!895359))

(declare-fun m!895361 () Bool)

(assert (=> start!82900 m!895361))

(declare-fun m!895363 () Bool)

(assert (=> mapNonEmpty!34774 m!895363))

(declare-fun m!895365 () Bool)

(assert (=> b!967346 m!895365))

(declare-fun m!895367 () Bool)

(assert (=> b!967351 m!895367))

(assert (=> b!967351 m!895347))

(assert (=> b!967351 m!895367))

(assert (=> b!967351 m!895347))

(declare-fun m!895369 () Bool)

(assert (=> b!967351 m!895369))

(check-sat (not b!967347) (not start!82900) b_and!30507 (not mapNonEmpty!34774) (not b_next!19045) (not b!967342) (not b!967351) (not b!967346) tp_is_empty!21853 (not b!967345))
(check-sat b_and!30507 (not b_next!19045))
