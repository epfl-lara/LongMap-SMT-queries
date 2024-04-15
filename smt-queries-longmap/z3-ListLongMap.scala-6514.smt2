; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82906 () Bool)

(assert start!82906)

(declare-fun b_free!19051 () Bool)

(declare-fun b_next!19051 () Bool)

(assert (=> start!82906 (= b_free!19051 (not b_next!19051))))

(declare-fun tp!66283 () Bool)

(declare-fun b_and!30513 () Bool)

(assert (=> start!82906 (= tp!66283 b_and!30513)))

(declare-fun b!967441 () Bool)

(declare-fun e!545246 () Bool)

(declare-fun tp_is_empty!21859 () Bool)

(assert (=> b!967441 (= e!545246 tp_is_empty!21859)))

(declare-fun mapIsEmpty!34783 () Bool)

(declare-fun mapRes!34783 () Bool)

(assert (=> mapIsEmpty!34783 mapRes!34783))

(declare-fun b!967442 () Bool)

(declare-fun res!647678 () Bool)

(declare-fun e!545244 () Bool)

(assert (=> b!967442 (=> (not res!647678) (not e!545244))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34129 0))(
  ( (V!34130 (val!10980 Int)) )
))
(declare-datatypes ((ValueCell!10448 0))(
  ( (ValueCellFull!10448 (v!13537 V!34129)) (EmptyCell!10448) )
))
(declare-datatypes ((array!59722 0))(
  ( (array!59723 (arr!28730 (Array (_ BitVec 32) ValueCell!10448)) (size!29211 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59722)

(declare-datatypes ((array!59724 0))(
  ( (array!59725 (arr!28731 (Array (_ BitVec 32) (_ BitVec 64))) (size!29212 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59724)

(declare-fun minValue!1342 () V!34129)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34129)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14198 0))(
  ( (tuple2!14199 (_1!7110 (_ BitVec 64)) (_2!7110 V!34129)) )
))
(declare-datatypes ((List!20001 0))(
  ( (Nil!19998) (Cons!19997 (h!21159 tuple2!14198) (t!28355 List!20001)) )
))
(declare-datatypes ((ListLongMap!12885 0))(
  ( (ListLongMap!12886 (toList!6458 List!20001)) )
))
(declare-fun contains!5503 (ListLongMap!12885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3620 (array!59724 array!59722 (_ BitVec 32) (_ BitVec 32) V!34129 V!34129 (_ BitVec 32) Int) ListLongMap!12885)

(assert (=> b!967442 (= res!647678 (contains!5503 (getCurrentListMap!3620 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28731 _keys!1686) i!803)))))

(declare-fun b!967443 () Bool)

(declare-fun e!545245 () Bool)

(assert (=> b!967443 (= e!545245 tp_is_empty!21859)))

(declare-fun res!647681 () Bool)

(assert (=> start!82906 (=> (not res!647681) (not e!545244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82906 (= res!647681 (validMask!0 mask!2110))))

(assert (=> start!82906 e!545244))

(assert (=> start!82906 true))

(declare-fun e!545248 () Bool)

(declare-fun array_inv!22309 (array!59722) Bool)

(assert (=> start!82906 (and (array_inv!22309 _values!1400) e!545248)))

(declare-fun array_inv!22310 (array!59724) Bool)

(assert (=> start!82906 (array_inv!22310 _keys!1686)))

(assert (=> start!82906 tp!66283))

(assert (=> start!82906 tp_is_empty!21859))

(declare-fun b!967444 () Bool)

(declare-fun res!647682 () Bool)

(assert (=> b!967444 (=> (not res!647682) (not e!545244))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967444 (= res!647682 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29212 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29212 _keys!1686))))))

(declare-fun b!967445 () Bool)

(declare-fun res!647679 () Bool)

(assert (=> b!967445 (=> (not res!647679) (not e!545244))))

(declare-datatypes ((List!20002 0))(
  ( (Nil!19999) (Cons!19998 (h!21160 (_ BitVec 64)) (t!28356 List!20002)) )
))
(declare-fun arrayNoDuplicates!0 (array!59724 (_ BitVec 32) List!20002) Bool)

(assert (=> b!967445 (= res!647679 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19999))))

(declare-fun b!967446 () Bool)

(declare-fun res!647683 () Bool)

(assert (=> b!967446 (=> (not res!647683) (not e!545244))))

(assert (=> b!967446 (= res!647683 (and (= (size!29211 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29212 _keys!1686) (size!29211 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967447 () Bool)

(assert (=> b!967447 (= e!545244 (not true))))

(assert (=> b!967447 (contains!5503 (getCurrentListMap!3620 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28731 _keys!1686) i!803))))

(declare-datatypes ((Unit!32208 0))(
  ( (Unit!32209) )
))
(declare-fun lt!431207 () Unit!32208)

(declare-fun lemmaInListMapFromThenInFromMinusOne!68 (array!59724 array!59722 (_ BitVec 32) (_ BitVec 32) V!34129 V!34129 (_ BitVec 32) (_ BitVec 32) Int) Unit!32208)

(assert (=> b!967447 (= lt!431207 (lemmaInListMapFromThenInFromMinusOne!68 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967448 () Bool)

(declare-fun res!647677 () Bool)

(assert (=> b!967448 (=> (not res!647677) (not e!545244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59724 (_ BitVec 32)) Bool)

(assert (=> b!967448 (= res!647677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967449 () Bool)

(assert (=> b!967449 (= e!545248 (and e!545246 mapRes!34783))))

(declare-fun condMapEmpty!34783 () Bool)

(declare-fun mapDefault!34783 () ValueCell!10448)

(assert (=> b!967449 (= condMapEmpty!34783 (= (arr!28730 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10448)) mapDefault!34783)))))

(declare-fun b!967450 () Bool)

(declare-fun res!647680 () Bool)

(assert (=> b!967450 (=> (not res!647680) (not e!545244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967450 (= res!647680 (validKeyInArray!0 (select (arr!28731 _keys!1686) i!803)))))

(declare-fun b!967451 () Bool)

(declare-fun res!647684 () Bool)

(assert (=> b!967451 (=> (not res!647684) (not e!545244))))

(assert (=> b!967451 (= res!647684 (bvsgt from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34783 () Bool)

(declare-fun tp!66282 () Bool)

(assert (=> mapNonEmpty!34783 (= mapRes!34783 (and tp!66282 e!545245))))

(declare-fun mapValue!34783 () ValueCell!10448)

(declare-fun mapKey!34783 () (_ BitVec 32))

(declare-fun mapRest!34783 () (Array (_ BitVec 32) ValueCell!10448))

(assert (=> mapNonEmpty!34783 (= (arr!28730 _values!1400) (store mapRest!34783 mapKey!34783 mapValue!34783))))

(assert (= (and start!82906 res!647681) b!967446))

(assert (= (and b!967446 res!647683) b!967448))

(assert (= (and b!967448 res!647677) b!967445))

(assert (= (and b!967445 res!647679) b!967444))

(assert (= (and b!967444 res!647682) b!967450))

(assert (= (and b!967450 res!647680) b!967442))

(assert (= (and b!967442 res!647678) b!967451))

(assert (= (and b!967451 res!647684) b!967447))

(assert (= (and b!967449 condMapEmpty!34783) mapIsEmpty!34783))

(assert (= (and b!967449 (not condMapEmpty!34783)) mapNonEmpty!34783))

(get-info :version)

(assert (= (and mapNonEmpty!34783 ((_ is ValueCellFull!10448) mapValue!34783)) b!967443))

(assert (= (and b!967449 ((_ is ValueCellFull!10448) mapDefault!34783)) b!967441))

(assert (= start!82906 b!967449))

(declare-fun m!895423 () Bool)

(assert (=> start!82906 m!895423))

(declare-fun m!895425 () Bool)

(assert (=> start!82906 m!895425))

(declare-fun m!895427 () Bool)

(assert (=> start!82906 m!895427))

(declare-fun m!895429 () Bool)

(assert (=> b!967450 m!895429))

(assert (=> b!967450 m!895429))

(declare-fun m!895431 () Bool)

(assert (=> b!967450 m!895431))

(declare-fun m!895433 () Bool)

(assert (=> b!967447 m!895433))

(assert (=> b!967447 m!895429))

(assert (=> b!967447 m!895433))

(assert (=> b!967447 m!895429))

(declare-fun m!895435 () Bool)

(assert (=> b!967447 m!895435))

(declare-fun m!895437 () Bool)

(assert (=> b!967447 m!895437))

(declare-fun m!895439 () Bool)

(assert (=> b!967448 m!895439))

(declare-fun m!895441 () Bool)

(assert (=> mapNonEmpty!34783 m!895441))

(declare-fun m!895443 () Bool)

(assert (=> b!967445 m!895443))

(declare-fun m!895445 () Bool)

(assert (=> b!967442 m!895445))

(assert (=> b!967442 m!895429))

(assert (=> b!967442 m!895445))

(assert (=> b!967442 m!895429))

(declare-fun m!895447 () Bool)

(assert (=> b!967442 m!895447))

(check-sat (not b!967445) (not b!967447) (not start!82906) (not mapNonEmpty!34783) tp_is_empty!21859 (not b_next!19051) b_and!30513 (not b!967442) (not b!967450) (not b!967448))
(check-sat b_and!30513 (not b_next!19051))
