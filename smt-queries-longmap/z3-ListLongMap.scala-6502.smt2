; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83020 () Bool)

(assert start!83020)

(declare-fun b_free!18979 () Bool)

(declare-fun b_next!18979 () Bool)

(assert (=> start!83020 (= b_free!18979 (not b_next!18979))))

(declare-fun tp!66067 () Bool)

(declare-fun b_and!30477 () Bool)

(assert (=> start!83020 (= tp!66067 b_and!30477)))

(declare-fun b!967438 () Bool)

(declare-fun res!647313 () Bool)

(declare-fun e!545434 () Bool)

(assert (=> b!967438 (=> (not res!647313) (not e!545434))))

(declare-datatypes ((array!59672 0))(
  ( (array!59673 (arr!28700 (Array (_ BitVec 32) (_ BitVec 64))) (size!29180 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59672)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59672 (_ BitVec 32)) Bool)

(assert (=> b!967438 (= res!647313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967439 () Bool)

(declare-fun res!647310 () Bool)

(assert (=> b!967439 (=> (not res!647310) (not e!545434))))

(declare-datatypes ((List!19907 0))(
  ( (Nil!19904) (Cons!19903 (h!21071 (_ BitVec 64)) (t!28262 List!19907)) )
))
(declare-fun arrayNoDuplicates!0 (array!59672 (_ BitVec 32) List!19907) Bool)

(assert (=> b!967439 (= res!647310 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19904))))

(declare-fun mapIsEmpty!34675 () Bool)

(declare-fun mapRes!34675 () Bool)

(assert (=> mapIsEmpty!34675 mapRes!34675))

(declare-fun b!967440 () Bool)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967440 (= e!545434 (and (bvsgt from!2084 newFrom!159) (bvsle from!2084 #b00000000000000000000000000000000)))))

(declare-fun b!967441 () Bool)

(declare-fun res!647311 () Bool)

(assert (=> b!967441 (=> (not res!647311) (not e!545434))))

(declare-datatypes ((V!34033 0))(
  ( (V!34034 (val!10944 Int)) )
))
(declare-fun minValue!1342 () V!34033)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10412 0))(
  ( (ValueCellFull!10412 (v!13499 V!34033)) (EmptyCell!10412) )
))
(declare-datatypes ((array!59674 0))(
  ( (array!59675 (arr!28701 (Array (_ BitVec 32) ValueCell!10412)) (size!29181 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59674)

(declare-fun zeroValue!1342 () V!34033)

(declare-datatypes ((tuple2!14058 0))(
  ( (tuple2!14059 (_1!7040 (_ BitVec 64)) (_2!7040 V!34033)) )
))
(declare-datatypes ((List!19908 0))(
  ( (Nil!19905) (Cons!19904 (h!21072 tuple2!14058) (t!28263 List!19908)) )
))
(declare-datatypes ((ListLongMap!12757 0))(
  ( (ListLongMap!12758 (toList!6394 List!19908)) )
))
(declare-fun contains!5506 (ListLongMap!12757 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3627 (array!59672 array!59674 (_ BitVec 32) (_ BitVec 32) V!34033 V!34033 (_ BitVec 32) Int) ListLongMap!12757)

(assert (=> b!967441 (= res!647311 (contains!5506 (getCurrentListMap!3627 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28700 _keys!1686) i!803)))))

(declare-fun b!967442 () Bool)

(declare-fun res!647315 () Bool)

(assert (=> b!967442 (=> (not res!647315) (not e!545434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967442 (= res!647315 (validKeyInArray!0 (select (arr!28700 _keys!1686) i!803)))))

(declare-fun res!647316 () Bool)

(assert (=> start!83020 (=> (not res!647316) (not e!545434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83020 (= res!647316 (validMask!0 mask!2110))))

(assert (=> start!83020 e!545434))

(assert (=> start!83020 true))

(declare-fun e!545436 () Bool)

(declare-fun array_inv!22281 (array!59674) Bool)

(assert (=> start!83020 (and (array_inv!22281 _values!1400) e!545436)))

(declare-fun array_inv!22282 (array!59672) Bool)

(assert (=> start!83020 (array_inv!22282 _keys!1686)))

(assert (=> start!83020 tp!66067))

(declare-fun tp_is_empty!21787 () Bool)

(assert (=> start!83020 tp_is_empty!21787))

(declare-fun b!967443 () Bool)

(declare-fun e!545435 () Bool)

(assert (=> b!967443 (= e!545435 tp_is_empty!21787)))

(declare-fun b!967444 () Bool)

(declare-fun res!647312 () Bool)

(assert (=> b!967444 (=> (not res!647312) (not e!545434))))

(assert (=> b!967444 (= res!647312 (and (= (size!29181 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29180 _keys!1686) (size!29181 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34675 () Bool)

(declare-fun tp!66066 () Bool)

(declare-fun e!545438 () Bool)

(assert (=> mapNonEmpty!34675 (= mapRes!34675 (and tp!66066 e!545438))))

(declare-fun mapRest!34675 () (Array (_ BitVec 32) ValueCell!10412))

(declare-fun mapKey!34675 () (_ BitVec 32))

(declare-fun mapValue!34675 () ValueCell!10412)

(assert (=> mapNonEmpty!34675 (= (arr!28701 _values!1400) (store mapRest!34675 mapKey!34675 mapValue!34675))))

(declare-fun b!967445 () Bool)

(assert (=> b!967445 (= e!545436 (and e!545435 mapRes!34675))))

(declare-fun condMapEmpty!34675 () Bool)

(declare-fun mapDefault!34675 () ValueCell!10412)

(assert (=> b!967445 (= condMapEmpty!34675 (= (arr!28701 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10412)) mapDefault!34675)))))

(declare-fun b!967446 () Bool)

(declare-fun res!647314 () Bool)

(assert (=> b!967446 (=> (not res!647314) (not e!545434))))

(assert (=> b!967446 (= res!647314 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29180 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29180 _keys!1686))))))

(declare-fun b!967447 () Bool)

(assert (=> b!967447 (= e!545438 tp_is_empty!21787)))

(assert (= (and start!83020 res!647316) b!967444))

(assert (= (and b!967444 res!647312) b!967438))

(assert (= (and b!967438 res!647313) b!967439))

(assert (= (and b!967439 res!647310) b!967446))

(assert (= (and b!967446 res!647314) b!967442))

(assert (= (and b!967442 res!647315) b!967441))

(assert (= (and b!967441 res!647311) b!967440))

(assert (= (and b!967445 condMapEmpty!34675) mapIsEmpty!34675))

(assert (= (and b!967445 (not condMapEmpty!34675)) mapNonEmpty!34675))

(get-info :version)

(assert (= (and mapNonEmpty!34675 ((_ is ValueCellFull!10412) mapValue!34675)) b!967447))

(assert (= (and b!967445 ((_ is ValueCellFull!10412) mapDefault!34675)) b!967443))

(assert (= start!83020 b!967445))

(declare-fun m!896593 () Bool)

(assert (=> b!967441 m!896593))

(declare-fun m!896595 () Bool)

(assert (=> b!967441 m!896595))

(assert (=> b!967441 m!896593))

(assert (=> b!967441 m!896595))

(declare-fun m!896597 () Bool)

(assert (=> b!967441 m!896597))

(declare-fun m!896599 () Bool)

(assert (=> mapNonEmpty!34675 m!896599))

(declare-fun m!896601 () Bool)

(assert (=> start!83020 m!896601))

(declare-fun m!896603 () Bool)

(assert (=> start!83020 m!896603))

(declare-fun m!896605 () Bool)

(assert (=> start!83020 m!896605))

(assert (=> b!967442 m!896595))

(assert (=> b!967442 m!896595))

(declare-fun m!896607 () Bool)

(assert (=> b!967442 m!896607))

(declare-fun m!896609 () Bool)

(assert (=> b!967439 m!896609))

(declare-fun m!896611 () Bool)

(assert (=> b!967438 m!896611))

(check-sat (not start!83020) tp_is_empty!21787 (not b!967438) (not b!967439) (not b!967441) (not b!967442) (not mapNonEmpty!34675) b_and!30477 (not b_next!18979))
(check-sat b_and!30477 (not b_next!18979))
