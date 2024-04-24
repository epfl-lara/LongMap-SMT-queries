; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83544 () Bool)

(assert start!83544)

(declare-fun b_free!19369 () Bool)

(declare-fun b_next!19369 () Bool)

(assert (=> start!83544 (= b_free!19369 (not b_next!19369))))

(declare-fun tp!67387 () Bool)

(declare-fun b_and!30969 () Bool)

(assert (=> start!83544 (= tp!67387 b_and!30969)))

(declare-fun mapNonEmpty!35410 () Bool)

(declare-fun mapRes!35410 () Bool)

(declare-fun tp!67386 () Bool)

(declare-fun e!549371 () Bool)

(assert (=> mapNonEmpty!35410 (= mapRes!35410 (and tp!67386 e!549371))))

(declare-fun mapKey!35410 () (_ BitVec 32))

(declare-datatypes ((V!34673 0))(
  ( (V!34674 (val!11184 Int)) )
))
(declare-datatypes ((ValueCell!10652 0))(
  ( (ValueCellFull!10652 (v!13740 V!34673)) (EmptyCell!10652) )
))
(declare-datatypes ((array!60606 0))(
  ( (array!60607 (arr!29162 (Array (_ BitVec 32) ValueCell!10652)) (size!29642 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60606)

(declare-fun mapRest!35410 () (Array (_ BitVec 32) ValueCell!10652))

(declare-fun mapValue!35410 () ValueCell!10652)

(assert (=> mapNonEmpty!35410 (= (arr!29162 _values!1425) (store mapRest!35410 mapKey!35410 mapValue!35410))))

(declare-fun b!974499 () Bool)

(declare-fun e!549367 () Bool)

(declare-fun e!549372 () Bool)

(assert (=> b!974499 (= e!549367 (and e!549372 mapRes!35410))))

(declare-fun condMapEmpty!35410 () Bool)

(declare-fun mapDefault!35410 () ValueCell!10652)

(assert (=> b!974499 (= condMapEmpty!35410 (= (arr!29162 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10652)) mapDefault!35410)))))

(declare-fun b!974500 () Bool)

(declare-fun res!652048 () Bool)

(declare-fun e!549370 () Bool)

(assert (=> b!974500 (=> (not res!652048) (not e!549370))))

(declare-datatypes ((array!60608 0))(
  ( (array!60609 (arr!29163 (Array (_ BitVec 32) (_ BitVec 64))) (size!29643 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60608)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974500 (= res!652048 (validKeyInArray!0 (select (arr!29163 _keys!1717) i!822)))))

(declare-fun b!974501 () Bool)

(declare-fun res!652045 () Bool)

(assert (=> b!974501 (=> (not res!652045) (not e!549370))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!974501 (= res!652045 (and (= (size!29642 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29643 _keys!1717) (size!29642 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974502 () Bool)

(declare-fun e!549368 () Bool)

(assert (=> b!974502 (= e!549370 e!549368)))

(declare-fun res!652049 () Bool)

(assert (=> b!974502 (=> (not res!652049) (not e!549368))))

(declare-datatypes ((tuple2!14368 0))(
  ( (tuple2!14369 (_1!7195 (_ BitVec 64)) (_2!7195 V!34673)) )
))
(declare-datatypes ((List!20215 0))(
  ( (Nil!20212) (Cons!20211 (h!21379 tuple2!14368) (t!28674 List!20215)) )
))
(declare-datatypes ((ListLongMap!13067 0))(
  ( (ListLongMap!13068 (toList!6549 List!20215)) )
))
(declare-fun lt!432957 () ListLongMap!13067)

(declare-fun contains!5655 (ListLongMap!13067 (_ BitVec 64)) Bool)

(assert (=> b!974502 (= res!652049 (contains!5655 lt!432957 (select (arr!29163 _keys!1717) i!822)))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34673)

(declare-fun zeroValue!1367 () V!34673)

(declare-fun getCurrentListMap!3782 (array!60608 array!60606 (_ BitVec 32) (_ BitVec 32) V!34673 V!34673 (_ BitVec 32) Int) ListLongMap!13067)

(assert (=> b!974502 (= lt!432957 (getCurrentListMap!3782 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!974503 () Bool)

(declare-fun e!549373 () Bool)

(assert (=> b!974503 (= e!549368 e!549373)))

(declare-fun res!652050 () Bool)

(assert (=> b!974503 (=> (not res!652050) (not e!549373))))

(declare-fun lt!432955 () (_ BitVec 64))

(assert (=> b!974503 (= res!652050 (validKeyInArray!0 lt!432955))))

(assert (=> b!974503 (= lt!432955 (select (arr!29163 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432958 () ListLongMap!13067)

(assert (=> b!974503 (= lt!432958 (getCurrentListMap!3782 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974505 () Bool)

(declare-fun res!652052 () Bool)

(assert (=> b!974505 (=> (not res!652052) (not e!549370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60608 (_ BitVec 32)) Bool)

(assert (=> b!974505 (= res!652052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974506 () Bool)

(declare-fun res!652047 () Bool)

(assert (=> b!974506 (=> (not res!652047) (not e!549370))))

(declare-datatypes ((List!20216 0))(
  ( (Nil!20213) (Cons!20212 (h!21380 (_ BitVec 64)) (t!28675 List!20216)) )
))
(declare-fun arrayNoDuplicates!0 (array!60608 (_ BitVec 32) List!20216) Bool)

(assert (=> b!974506 (= res!652047 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20213))))

(declare-fun b!974507 () Bool)

(declare-fun tp_is_empty!22267 () Bool)

(assert (=> b!974507 (= e!549372 tp_is_empty!22267)))

(declare-fun b!974508 () Bool)

(assert (=> b!974508 (= e!549373 (not true))))

(declare-fun lt!432960 () tuple2!14368)

(declare-fun +!2922 (ListLongMap!13067 tuple2!14368) ListLongMap!13067)

(assert (=> b!974508 (contains!5655 (+!2922 lt!432957 lt!432960) (select (arr!29163 _keys!1717) i!822))))

(declare-datatypes ((Unit!32408 0))(
  ( (Unit!32409) )
))
(declare-fun lt!432959 () Unit!32408)

(declare-fun lt!432954 () V!34673)

(declare-fun addStillContains!604 (ListLongMap!13067 (_ BitVec 64) V!34673 (_ BitVec 64)) Unit!32408)

(assert (=> b!974508 (= lt!432959 (addStillContains!604 lt!432957 lt!432955 lt!432954 (select (arr!29163 _keys!1717) i!822)))))

(assert (=> b!974508 (= lt!432958 (+!2922 (getCurrentListMap!3782 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432960))))

(assert (=> b!974508 (= lt!432960 (tuple2!14369 lt!432955 lt!432954))))

(declare-fun get!15137 (ValueCell!10652 V!34673) V!34673)

(declare-fun dynLambda!1719 (Int (_ BitVec 64)) V!34673)

(assert (=> b!974508 (= lt!432954 (get!15137 (select (arr!29162 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1719 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432956 () Unit!32408)

(declare-fun lemmaListMapRecursiveValidKeyArray!278 (array!60608 array!60606 (_ BitVec 32) (_ BitVec 32) V!34673 V!34673 (_ BitVec 32) Int) Unit!32408)

(assert (=> b!974508 (= lt!432956 (lemmaListMapRecursiveValidKeyArray!278 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974509 () Bool)

(declare-fun res!652051 () Bool)

(assert (=> b!974509 (=> (not res!652051) (not e!549370))))

(assert (=> b!974509 (= res!652051 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29643 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29643 _keys!1717))))))

(declare-fun mapIsEmpty!35410 () Bool)

(assert (=> mapIsEmpty!35410 mapRes!35410))

(declare-fun res!652046 () Bool)

(assert (=> start!83544 (=> (not res!652046) (not e!549370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83544 (= res!652046 (validMask!0 mask!2147))))

(assert (=> start!83544 e!549370))

(assert (=> start!83544 true))

(declare-fun array_inv!22611 (array!60606) Bool)

(assert (=> start!83544 (and (array_inv!22611 _values!1425) e!549367)))

(assert (=> start!83544 tp_is_empty!22267))

(assert (=> start!83544 tp!67387))

(declare-fun array_inv!22612 (array!60608) Bool)

(assert (=> start!83544 (array_inv!22612 _keys!1717)))

(declare-fun b!974504 () Bool)

(assert (=> b!974504 (= e!549371 tp_is_empty!22267)))

(assert (= (and start!83544 res!652046) b!974501))

(assert (= (and b!974501 res!652045) b!974505))

(assert (= (and b!974505 res!652052) b!974506))

(assert (= (and b!974506 res!652047) b!974509))

(assert (= (and b!974509 res!652051) b!974500))

(assert (= (and b!974500 res!652048) b!974502))

(assert (= (and b!974502 res!652049) b!974503))

(assert (= (and b!974503 res!652050) b!974508))

(assert (= (and b!974499 condMapEmpty!35410) mapIsEmpty!35410))

(assert (= (and b!974499 (not condMapEmpty!35410)) mapNonEmpty!35410))

(get-info :version)

(assert (= (and mapNonEmpty!35410 ((_ is ValueCellFull!10652) mapValue!35410)) b!974504))

(assert (= (and b!974499 ((_ is ValueCellFull!10652) mapDefault!35410)) b!974507))

(assert (= start!83544 b!974499))

(declare-fun b_lambda!14547 () Bool)

(assert (=> (not b_lambda!14547) (not b!974508)))

(declare-fun t!28673 () Bool)

(declare-fun tb!6309 () Bool)

(assert (=> (and start!83544 (= defaultEntry!1428 defaultEntry!1428) t!28673) tb!6309))

(declare-fun result!12603 () Bool)

(assert (=> tb!6309 (= result!12603 tp_is_empty!22267)))

(assert (=> b!974508 t!28673))

(declare-fun b_and!30971 () Bool)

(assert (= b_and!30969 (and (=> t!28673 result!12603) b_and!30971)))

(declare-fun m!902525 () Bool)

(assert (=> b!974506 m!902525))

(declare-fun m!902527 () Bool)

(assert (=> b!974508 m!902527))

(declare-fun m!902529 () Bool)

(assert (=> b!974508 m!902529))

(declare-fun m!902531 () Bool)

(assert (=> b!974508 m!902531))

(declare-fun m!902533 () Bool)

(assert (=> b!974508 m!902533))

(assert (=> b!974508 m!902533))

(declare-fun m!902535 () Bool)

(assert (=> b!974508 m!902535))

(declare-fun m!902537 () Bool)

(assert (=> b!974508 m!902537))

(assert (=> b!974508 m!902527))

(assert (=> b!974508 m!902531))

(declare-fun m!902539 () Bool)

(assert (=> b!974508 m!902539))

(assert (=> b!974508 m!902529))

(declare-fun m!902541 () Bool)

(assert (=> b!974508 m!902541))

(declare-fun m!902543 () Bool)

(assert (=> b!974508 m!902543))

(assert (=> b!974508 m!902535))

(assert (=> b!974508 m!902535))

(declare-fun m!902545 () Bool)

(assert (=> b!974508 m!902545))

(assert (=> b!974500 m!902535))

(assert (=> b!974500 m!902535))

(declare-fun m!902547 () Bool)

(assert (=> b!974500 m!902547))

(declare-fun m!902549 () Bool)

(assert (=> b!974503 m!902549))

(declare-fun m!902551 () Bool)

(assert (=> b!974503 m!902551))

(declare-fun m!902553 () Bool)

(assert (=> b!974503 m!902553))

(assert (=> b!974502 m!902535))

(assert (=> b!974502 m!902535))

(declare-fun m!902555 () Bool)

(assert (=> b!974502 m!902555))

(declare-fun m!902557 () Bool)

(assert (=> b!974502 m!902557))

(declare-fun m!902559 () Bool)

(assert (=> mapNonEmpty!35410 m!902559))

(declare-fun m!902561 () Bool)

(assert (=> start!83544 m!902561))

(declare-fun m!902563 () Bool)

(assert (=> start!83544 m!902563))

(declare-fun m!902565 () Bool)

(assert (=> start!83544 m!902565))

(declare-fun m!902567 () Bool)

(assert (=> b!974505 m!902567))

(check-sat (not b!974505) (not b_next!19369) (not mapNonEmpty!35410) (not b!974502) (not b_lambda!14547) (not b!974500) (not start!83544) (not b!974503) (not b!974508) tp_is_empty!22267 b_and!30971 (not b!974506))
(check-sat b_and!30971 (not b_next!19369))
