; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82704 () Bool)

(assert start!82704)

(declare-fun b_free!18837 () Bool)

(declare-fun b_next!18837 () Bool)

(assert (=> start!82704 (= b_free!18837 (not b_next!18837))))

(declare-fun tp!65631 () Bool)

(declare-fun b_and!30325 () Bool)

(assert (=> start!82704 (= tp!65631 b_and!30325)))

(declare-fun res!645527 () Bool)

(declare-fun e!543704 () Bool)

(assert (=> start!82704 (=> (not res!645527) (not e!543704))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82704 (= res!645527 (validMask!0 mask!2110))))

(assert (=> start!82704 e!543704))

(assert (=> start!82704 true))

(declare-datatypes ((V!33835 0))(
  ( (V!33836 (val!10870 Int)) )
))
(declare-datatypes ((ValueCell!10338 0))(
  ( (ValueCellFull!10338 (v!13428 V!33835)) (EmptyCell!10338) )
))
(declare-datatypes ((array!59365 0))(
  ( (array!59366 (arr!28551 (Array (_ BitVec 32) ValueCell!10338)) (size!29030 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59365)

(declare-fun e!543706 () Bool)

(declare-fun array_inv!22111 (array!59365) Bool)

(assert (=> start!82704 (and (array_inv!22111 _values!1400) e!543706)))

(declare-datatypes ((array!59367 0))(
  ( (array!59368 (arr!28552 (Array (_ BitVec 32) (_ BitVec 64))) (size!29031 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59367)

(declare-fun array_inv!22112 (array!59367) Bool)

(assert (=> start!82704 (array_inv!22112 _keys!1686)))

(assert (=> start!82704 tp!65631))

(declare-fun tp_is_empty!21639 () Bool)

(assert (=> start!82704 tp_is_empty!21639))

(declare-fun b!964424 () Bool)

(declare-fun e!543702 () Bool)

(assert (=> b!964424 (= e!543702 tp_is_empty!21639)))

(declare-fun b!964425 () Bool)

(declare-fun e!543703 () Bool)

(assert (=> b!964425 (= e!543704 (not e!543703))))

(declare-fun res!645522 () Bool)

(assert (=> b!964425 (=> res!645522 e!543703)))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964425 (= res!645522 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29031 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33835)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33835)

(declare-datatypes ((tuple2!13970 0))(
  ( (tuple2!13971 (_1!6996 (_ BitVec 64)) (_2!6996 V!33835)) )
))
(declare-datatypes ((List!19816 0))(
  ( (Nil!19813) (Cons!19812 (h!20974 tuple2!13970) (t!28179 List!19816)) )
))
(declare-datatypes ((ListLongMap!12667 0))(
  ( (ListLongMap!12668 (toList!6349 List!19816)) )
))
(declare-fun contains!5452 (ListLongMap!12667 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3582 (array!59367 array!59365 (_ BitVec 32) (_ BitVec 32) V!33835 V!33835 (_ BitVec 32) Int) ListLongMap!12667)

(assert (=> b!964425 (contains!5452 (getCurrentListMap!3582 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28552 _keys!1686) i!803))))

(declare-datatypes ((Unit!32281 0))(
  ( (Unit!32282) )
))
(declare-fun lt!431101 () Unit!32281)

(declare-fun lemmaInListMapFromThenInFromMinusOne!35 (array!59367 array!59365 (_ BitVec 32) (_ BitVec 32) V!33835 V!33835 (_ BitVec 32) (_ BitVec 32) Int) Unit!32281)

(assert (=> b!964425 (= lt!431101 (lemmaInListMapFromThenInFromMinusOne!35 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964426 () Bool)

(declare-fun res!645525 () Bool)

(assert (=> b!964426 (=> (not res!645525) (not e!543704))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964426 (= res!645525 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964427 () Bool)

(assert (=> b!964427 (= e!543703 true)))

(assert (=> b!964427 (contains!5452 (getCurrentListMap!3582 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28552 _keys!1686) i!803))))

(declare-fun lt!431100 () Unit!32281)

(declare-fun lemmaInListMapFromThenInFromSmaller!32 (array!59367 array!59365 (_ BitVec 32) (_ BitVec 32) V!33835 V!33835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32281)

(assert (=> b!964427 (= lt!431100 (lemmaInListMapFromThenInFromSmaller!32 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964428 () Bool)

(declare-fun e!543707 () Bool)

(declare-fun mapRes!34453 () Bool)

(assert (=> b!964428 (= e!543706 (and e!543707 mapRes!34453))))

(declare-fun condMapEmpty!34453 () Bool)

(declare-fun mapDefault!34453 () ValueCell!10338)

(assert (=> b!964428 (= condMapEmpty!34453 (= (arr!28551 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10338)) mapDefault!34453)))))

(declare-fun b!964429 () Bool)

(declare-fun res!645523 () Bool)

(assert (=> b!964429 (=> (not res!645523) (not e!543704))))

(assert (=> b!964429 (= res!645523 (contains!5452 (getCurrentListMap!3582 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28552 _keys!1686) i!803)))))

(declare-fun b!964430 () Bool)

(declare-fun res!645528 () Bool)

(assert (=> b!964430 (=> (not res!645528) (not e!543704))))

(assert (=> b!964430 (= res!645528 (and (= (size!29030 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29031 _keys!1686) (size!29030 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964431 () Bool)

(declare-fun res!645529 () Bool)

(assert (=> b!964431 (=> (not res!645529) (not e!543704))))

(assert (=> b!964431 (= res!645529 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29031 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29031 _keys!1686))))))

(declare-fun b!964432 () Bool)

(declare-fun res!645526 () Bool)

(assert (=> b!964432 (=> (not res!645526) (not e!543704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59367 (_ BitVec 32)) Bool)

(assert (=> b!964432 (= res!645526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964433 () Bool)

(declare-fun res!645524 () Bool)

(assert (=> b!964433 (=> (not res!645524) (not e!543704))))

(declare-datatypes ((List!19817 0))(
  ( (Nil!19814) (Cons!19813 (h!20975 (_ BitVec 64)) (t!28180 List!19817)) )
))
(declare-fun arrayNoDuplicates!0 (array!59367 (_ BitVec 32) List!19817) Bool)

(assert (=> b!964433 (= res!645524 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19814))))

(declare-fun b!964434 () Bool)

(assert (=> b!964434 (= e!543707 tp_is_empty!21639)))

(declare-fun b!964435 () Bool)

(declare-fun res!645521 () Bool)

(assert (=> b!964435 (=> (not res!645521) (not e!543704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964435 (= res!645521 (validKeyInArray!0 (select (arr!28552 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34453 () Bool)

(declare-fun tp!65630 () Bool)

(assert (=> mapNonEmpty!34453 (= mapRes!34453 (and tp!65630 e!543702))))

(declare-fun mapValue!34453 () ValueCell!10338)

(declare-fun mapRest!34453 () (Array (_ BitVec 32) ValueCell!10338))

(declare-fun mapKey!34453 () (_ BitVec 32))

(assert (=> mapNonEmpty!34453 (= (arr!28551 _values!1400) (store mapRest!34453 mapKey!34453 mapValue!34453))))

(declare-fun mapIsEmpty!34453 () Bool)

(assert (=> mapIsEmpty!34453 mapRes!34453))

(assert (= (and start!82704 res!645527) b!964430))

(assert (= (and b!964430 res!645528) b!964432))

(assert (= (and b!964432 res!645526) b!964433))

(assert (= (and b!964433 res!645524) b!964431))

(assert (= (and b!964431 res!645529) b!964435))

(assert (= (and b!964435 res!645521) b!964429))

(assert (= (and b!964429 res!645523) b!964426))

(assert (= (and b!964426 res!645525) b!964425))

(assert (= (and b!964425 (not res!645522)) b!964427))

(assert (= (and b!964428 condMapEmpty!34453) mapIsEmpty!34453))

(assert (= (and b!964428 (not condMapEmpty!34453)) mapNonEmpty!34453))

(get-info :version)

(assert (= (and mapNonEmpty!34453 ((_ is ValueCellFull!10338) mapValue!34453)) b!964424))

(assert (= (and b!964428 ((_ is ValueCellFull!10338) mapDefault!34453)) b!964434))

(assert (= start!82704 b!964428))

(declare-fun m!893681 () Bool)

(assert (=> start!82704 m!893681))

(declare-fun m!893683 () Bool)

(assert (=> start!82704 m!893683))

(declare-fun m!893685 () Bool)

(assert (=> start!82704 m!893685))

(declare-fun m!893687 () Bool)

(assert (=> b!964425 m!893687))

(declare-fun m!893689 () Bool)

(assert (=> b!964425 m!893689))

(assert (=> b!964425 m!893687))

(assert (=> b!964425 m!893689))

(declare-fun m!893691 () Bool)

(assert (=> b!964425 m!893691))

(declare-fun m!893693 () Bool)

(assert (=> b!964425 m!893693))

(declare-fun m!893695 () Bool)

(assert (=> b!964429 m!893695))

(assert (=> b!964429 m!893689))

(assert (=> b!964429 m!893695))

(assert (=> b!964429 m!893689))

(declare-fun m!893697 () Bool)

(assert (=> b!964429 m!893697))

(declare-fun m!893699 () Bool)

(assert (=> mapNonEmpty!34453 m!893699))

(declare-fun m!893701 () Bool)

(assert (=> b!964433 m!893701))

(declare-fun m!893703 () Bool)

(assert (=> b!964427 m!893703))

(assert (=> b!964427 m!893689))

(assert (=> b!964427 m!893703))

(assert (=> b!964427 m!893689))

(declare-fun m!893705 () Bool)

(assert (=> b!964427 m!893705))

(declare-fun m!893707 () Bool)

(assert (=> b!964427 m!893707))

(assert (=> b!964435 m!893689))

(assert (=> b!964435 m!893689))

(declare-fun m!893709 () Bool)

(assert (=> b!964435 m!893709))

(declare-fun m!893711 () Bool)

(assert (=> b!964432 m!893711))

(check-sat (not b!964435) (not start!82704) (not b!964425) b_and!30325 (not b_next!18837) (not b!964429) (not mapNonEmpty!34453) (not b!964432) (not b!964427) (not b!964433) tp_is_empty!21639)
(check-sat b_and!30325 (not b_next!18837))
