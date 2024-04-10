; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39250 () Bool)

(assert start!39250)

(declare-fun b_free!9517 () Bool)

(declare-fun b_next!9517 () Bool)

(assert (=> start!39250 (= b_free!9517 (not b_next!9517))))

(declare-fun tp!34079 () Bool)

(declare-fun b_and!16909 () Bool)

(assert (=> start!39250 (= tp!34079 b_and!16909)))

(declare-fun mapNonEmpty!17625 () Bool)

(declare-fun mapRes!17625 () Bool)

(declare-fun tp!34080 () Bool)

(declare-fun e!247734 () Bool)

(assert (=> mapNonEmpty!17625 (= mapRes!17625 (and tp!34080 e!247734))))

(declare-fun mapKey!17625 () (_ BitVec 32))

(declare-datatypes ((V!15331 0))(
  ( (V!15332 (val!5379 Int)) )
))
(declare-datatypes ((ValueCell!4991 0))(
  ( (ValueCellFull!4991 (v!7626 V!15331)) (EmptyCell!4991) )
))
(declare-datatypes ((array!25195 0))(
  ( (array!25196 (arr!12047 (Array (_ BitVec 32) ValueCell!4991)) (size!12399 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25195)

(declare-fun mapValue!17625 () ValueCell!4991)

(declare-fun mapRest!17625 () (Array (_ BitVec 32) ValueCell!4991))

(assert (=> mapNonEmpty!17625 (= (arr!12047 _values!549) (store mapRest!17625 mapKey!17625 mapValue!17625))))

(declare-fun b!414539 () Bool)

(declare-fun e!247735 () Bool)

(declare-fun tp_is_empty!10669 () Bool)

(assert (=> b!414539 (= e!247735 tp_is_empty!10669)))

(declare-fun b!414540 () Bool)

(declare-fun res!241049 () Bool)

(declare-fun e!247736 () Bool)

(assert (=> b!414540 (=> (not res!241049) (not e!247736))))

(declare-datatypes ((array!25197 0))(
  ( (array!25198 (arr!12048 (Array (_ BitVec 32) (_ BitVec 64))) (size!12400 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25197)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25197 (_ BitVec 32)) Bool)

(assert (=> b!414540 (= res!241049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414541 () Bool)

(declare-fun res!241044 () Bool)

(assert (=> b!414541 (=> (not res!241044) (not e!247736))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414541 (= res!241044 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!414542 () Bool)

(declare-fun e!247730 () Bool)

(declare-fun e!247729 () Bool)

(assert (=> b!414542 (= e!247730 e!247729)))

(declare-fun res!241047 () Bool)

(assert (=> b!414542 (=> (not res!241047) (not e!247729))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414542 (= res!241047 (= from!863 i!563))))

(declare-fun minValue!515 () V!15331)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15331)

(declare-fun lt!190026 () array!25195)

(declare-fun lt!190025 () array!25197)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6998 0))(
  ( (tuple2!6999 (_1!3510 (_ BitVec 64)) (_2!3510 V!15331)) )
))
(declare-datatypes ((List!7020 0))(
  ( (Nil!7017) (Cons!7016 (h!7872 tuple2!6998) (t!12202 List!7020)) )
))
(declare-datatypes ((ListLongMap!5911 0))(
  ( (ListLongMap!5912 (toList!2971 List!7020)) )
))
(declare-fun lt!190024 () ListLongMap!5911)

(declare-fun getCurrentListMapNoExtraKeys!1177 (array!25197 array!25195 (_ BitVec 32) (_ BitVec 32) V!15331 V!15331 (_ BitVec 32) Int) ListLongMap!5911)

(assert (=> b!414542 (= lt!190024 (getCurrentListMapNoExtraKeys!1177 lt!190025 lt!190026 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15331)

(assert (=> b!414542 (= lt!190026 (array!25196 (store (arr!12047 _values!549) i!563 (ValueCellFull!4991 v!412)) (size!12399 _values!549)))))

(declare-fun lt!190027 () ListLongMap!5911)

(assert (=> b!414542 (= lt!190027 (getCurrentListMapNoExtraKeys!1177 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414543 () Bool)

(declare-fun res!241053 () Bool)

(assert (=> b!414543 (=> (not res!241053) (not e!247736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414543 (= res!241053 (validKeyInArray!0 k!794))))

(declare-fun e!247737 () Bool)

(declare-fun call!28730 () ListLongMap!5911)

(declare-fun b!414544 () Bool)

(declare-fun call!28729 () ListLongMap!5911)

(declare-fun +!1177 (ListLongMap!5911 tuple2!6998) ListLongMap!5911)

(assert (=> b!414544 (= e!247737 (= call!28730 (+!1177 call!28729 (tuple2!6999 k!794 v!412))))))

(declare-fun b!414545 () Bool)

(declare-fun res!241043 () Bool)

(assert (=> b!414545 (=> (not res!241043) (not e!247736))))

(assert (=> b!414545 (= res!241043 (and (= (size!12399 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12400 _keys!709) (size!12399 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414546 () Bool)

(assert (=> b!414546 (= e!247737 (= call!28729 call!28730))))

(declare-fun b!414547 () Bool)

(declare-fun res!241052 () Bool)

(assert (=> b!414547 (=> (not res!241052) (not e!247736))))

(assert (=> b!414547 (= res!241052 (or (= (select (arr!12048 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12048 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414548 () Bool)

(declare-fun e!247731 () Bool)

(assert (=> b!414548 (= e!247731 true)))

(declare-fun get!5941 (ValueCell!4991 V!15331) V!15331)

(declare-fun dynLambda!654 (Int (_ BitVec 64)) V!15331)

(assert (=> b!414548 (= lt!190024 (+!1177 (getCurrentListMapNoExtraKeys!1177 lt!190025 lt!190026 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6999 (select (arr!12048 lt!190025) from!863) (get!5941 (select (arr!12047 lt!190026) from!863) (dynLambda!654 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414549 () Bool)

(declare-fun res!241040 () Bool)

(assert (=> b!414549 (=> (not res!241040) (not e!247736))))

(assert (=> b!414549 (= res!241040 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12400 _keys!709))))))

(declare-fun bm!28727 () Bool)

(declare-fun c!54989 () Bool)

(assert (=> bm!28727 (= call!28729 (getCurrentListMapNoExtraKeys!1177 (ite c!54989 _keys!709 lt!190025) (ite c!54989 _values!549 lt!190026) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414550 () Bool)

(declare-fun res!241041 () Bool)

(assert (=> b!414550 (=> (not res!241041) (not e!247736))))

(declare-datatypes ((List!7021 0))(
  ( (Nil!7018) (Cons!7017 (h!7873 (_ BitVec 64)) (t!12203 List!7021)) )
))
(declare-fun arrayNoDuplicates!0 (array!25197 (_ BitVec 32) List!7021) Bool)

(assert (=> b!414550 (= res!241041 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7018))))

(declare-fun b!414551 () Bool)

(assert (=> b!414551 (= e!247729 (not e!247731))))

(declare-fun res!241045 () Bool)

(assert (=> b!414551 (=> res!241045 e!247731)))

(assert (=> b!414551 (= res!241045 (validKeyInArray!0 (select (arr!12048 _keys!709) from!863)))))

(assert (=> b!414551 e!247737))

(assert (=> b!414551 (= c!54989 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12258 0))(
  ( (Unit!12259) )
))
(declare-fun lt!190028 () Unit!12258)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!387 (array!25197 array!25195 (_ BitVec 32) (_ BitVec 32) V!15331 V!15331 (_ BitVec 32) (_ BitVec 64) V!15331 (_ BitVec 32) Int) Unit!12258)

(assert (=> b!414551 (= lt!190028 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!387 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414552 () Bool)

(declare-fun res!241048 () Bool)

(assert (=> b!414552 (=> (not res!241048) (not e!247730))))

(assert (=> b!414552 (= res!241048 (bvsle from!863 i!563))))

(declare-fun b!414553 () Bool)

(assert (=> b!414553 (= e!247736 e!247730)))

(declare-fun res!241050 () Bool)

(assert (=> b!414553 (=> (not res!241050) (not e!247730))))

(assert (=> b!414553 (= res!241050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190025 mask!1025))))

(assert (=> b!414553 (= lt!190025 (array!25198 (store (arr!12048 _keys!709) i!563 k!794) (size!12400 _keys!709)))))

(declare-fun b!414554 () Bool)

(assert (=> b!414554 (= e!247734 tp_is_empty!10669)))

(declare-fun b!414555 () Bool)

(declare-fun res!241042 () Bool)

(assert (=> b!414555 (=> (not res!241042) (not e!247730))))

(assert (=> b!414555 (= res!241042 (arrayNoDuplicates!0 lt!190025 #b00000000000000000000000000000000 Nil!7018))))

(declare-fun b!414556 () Bool)

(declare-fun res!241046 () Bool)

(assert (=> b!414556 (=> (not res!241046) (not e!247736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414556 (= res!241046 (validMask!0 mask!1025))))

(declare-fun bm!28726 () Bool)

(assert (=> bm!28726 (= call!28730 (getCurrentListMapNoExtraKeys!1177 (ite c!54989 lt!190025 _keys!709) (ite c!54989 lt!190026 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!241051 () Bool)

(assert (=> start!39250 (=> (not res!241051) (not e!247736))))

(assert (=> start!39250 (= res!241051 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12400 _keys!709))))))

(assert (=> start!39250 e!247736))

(assert (=> start!39250 tp_is_empty!10669))

(assert (=> start!39250 tp!34079))

(assert (=> start!39250 true))

(declare-fun e!247732 () Bool)

(declare-fun array_inv!8786 (array!25195) Bool)

(assert (=> start!39250 (and (array_inv!8786 _values!549) e!247732)))

(declare-fun array_inv!8787 (array!25197) Bool)

(assert (=> start!39250 (array_inv!8787 _keys!709)))

(declare-fun b!414557 () Bool)

(assert (=> b!414557 (= e!247732 (and e!247735 mapRes!17625))))

(declare-fun condMapEmpty!17625 () Bool)

(declare-fun mapDefault!17625 () ValueCell!4991)

