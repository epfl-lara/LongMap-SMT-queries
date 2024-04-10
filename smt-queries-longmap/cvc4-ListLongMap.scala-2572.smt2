; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39254 () Bool)

(assert start!39254)

(declare-fun b_free!9521 () Bool)

(declare-fun b_next!9521 () Bool)

(assert (=> start!39254 (= b_free!9521 (not b_next!9521))))

(declare-fun tp!34092 () Bool)

(declare-fun b_and!16917 () Bool)

(assert (=> start!39254 (= tp!34092 b_and!16917)))

(declare-datatypes ((V!15335 0))(
  ( (V!15336 (val!5381 Int)) )
))
(declare-fun minValue!515 () V!15335)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4993 0))(
  ( (ValueCellFull!4993 (v!7628 V!15335)) (EmptyCell!4993) )
))
(declare-datatypes ((array!25203 0))(
  ( (array!25204 (arr!12051 (Array (_ BitVec 32) ValueCell!4993)) (size!12403 (_ BitVec 32))) )
))
(declare-fun lt!190055 () array!25203)

(declare-fun bm!28738 () Bool)

(declare-fun zeroValue!515 () V!15335)

(declare-datatypes ((tuple2!7002 0))(
  ( (tuple2!7003 (_1!3512 (_ BitVec 64)) (_2!3512 V!15335)) )
))
(declare-datatypes ((List!7024 0))(
  ( (Nil!7021) (Cons!7020 (h!7876 tuple2!7002) (t!12210 List!7024)) )
))
(declare-datatypes ((ListLongMap!5915 0))(
  ( (ListLongMap!5916 (toList!2973 List!7024)) )
))
(declare-fun call!28741 () ListLongMap!5915)

(declare-datatypes ((array!25205 0))(
  ( (array!25206 (arr!12052 (Array (_ BitVec 32) (_ BitVec 64))) (size!12404 (_ BitVec 32))) )
))
(declare-fun lt!190057 () array!25205)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25205)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!54995 () Bool)

(declare-fun _values!549 () array!25203)

(declare-fun getCurrentListMapNoExtraKeys!1179 (array!25205 array!25203 (_ BitVec 32) (_ BitVec 32) V!15335 V!15335 (_ BitVec 32) Int) ListLongMap!5915)

(assert (=> bm!28738 (= call!28741 (getCurrentListMapNoExtraKeys!1179 (ite c!54995 _keys!709 lt!190057) (ite c!54995 _values!549 lt!190055) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414657 () Bool)

(declare-fun res!241130 () Bool)

(declare-fun e!247784 () Bool)

(assert (=> b!414657 (=> (not res!241130) (not e!247784))))

(declare-datatypes ((List!7025 0))(
  ( (Nil!7022) (Cons!7021 (h!7877 (_ BitVec 64)) (t!12211 List!7025)) )
))
(declare-fun arrayNoDuplicates!0 (array!25205 (_ BitVec 32) List!7025) Bool)

(assert (=> b!414657 (= res!241130 (arrayNoDuplicates!0 lt!190057 #b00000000000000000000000000000000 Nil!7022))))

(declare-fun b!414658 () Bool)

(declare-fun e!247786 () Bool)

(declare-fun tp_is_empty!10673 () Bool)

(assert (=> b!414658 (= e!247786 tp_is_empty!10673)))

(declare-fun mapIsEmpty!17631 () Bool)

(declare-fun mapRes!17631 () Bool)

(assert (=> mapIsEmpty!17631 mapRes!17631))

(declare-fun b!414659 () Bool)

(declare-fun res!241136 () Bool)

(declare-fun e!247785 () Bool)

(assert (=> b!414659 (=> (not res!241136) (not e!247785))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414659 (= res!241136 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun call!28742 () ListLongMap!5915)

(declare-fun bm!28739 () Bool)

(assert (=> bm!28739 (= call!28742 (getCurrentListMapNoExtraKeys!1179 (ite c!54995 lt!190057 _keys!709) (ite c!54995 lt!190055 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414660 () Bool)

(declare-fun res!241129 () Bool)

(assert (=> b!414660 (=> (not res!241129) (not e!247785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25205 (_ BitVec 32)) Bool)

(assert (=> b!414660 (= res!241129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414661 () Bool)

(assert (=> b!414661 (= e!247785 e!247784)))

(declare-fun res!241132 () Bool)

(assert (=> b!414661 (=> (not res!241132) (not e!247784))))

(assert (=> b!414661 (= res!241132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190057 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414661 (= lt!190057 (array!25206 (store (arr!12052 _keys!709) i!563 k!794) (size!12404 _keys!709)))))

(declare-fun mapNonEmpty!17631 () Bool)

(declare-fun tp!34091 () Bool)

(assert (=> mapNonEmpty!17631 (= mapRes!17631 (and tp!34091 e!247786))))

(declare-fun mapKey!17631 () (_ BitVec 32))

(declare-fun mapRest!17631 () (Array (_ BitVec 32) ValueCell!4993))

(declare-fun mapValue!17631 () ValueCell!4993)

(assert (=> mapNonEmpty!17631 (= (arr!12051 _values!549) (store mapRest!17631 mapKey!17631 mapValue!17631))))

(declare-fun res!241128 () Bool)

(assert (=> start!39254 (=> (not res!241128) (not e!247785))))

(assert (=> start!39254 (= res!241128 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12404 _keys!709))))))

(assert (=> start!39254 e!247785))

(assert (=> start!39254 tp_is_empty!10673))

(assert (=> start!39254 tp!34092))

(assert (=> start!39254 true))

(declare-fun e!247787 () Bool)

(declare-fun array_inv!8790 (array!25203) Bool)

(assert (=> start!39254 (and (array_inv!8790 _values!549) e!247787)))

(declare-fun array_inv!8791 (array!25205) Bool)

(assert (=> start!39254 (array_inv!8791 _keys!709)))

(declare-fun b!414662 () Bool)

(declare-fun e!247789 () Bool)

(assert (=> b!414662 (= e!247784 e!247789)))

(declare-fun res!241127 () Bool)

(assert (=> b!414662 (=> (not res!241127) (not e!247789))))

(assert (=> b!414662 (= res!241127 (= from!863 i!563))))

(declare-fun lt!190054 () ListLongMap!5915)

(assert (=> b!414662 (= lt!190054 (getCurrentListMapNoExtraKeys!1179 lt!190057 lt!190055 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15335)

(assert (=> b!414662 (= lt!190055 (array!25204 (store (arr!12051 _values!549) i!563 (ValueCellFull!4993 v!412)) (size!12403 _values!549)))))

(declare-fun lt!190058 () ListLongMap!5915)

(assert (=> b!414662 (= lt!190058 (getCurrentListMapNoExtraKeys!1179 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414663 () Bool)

(declare-fun res!241137 () Bool)

(assert (=> b!414663 (=> (not res!241137) (not e!247784))))

(assert (=> b!414663 (= res!241137 (bvsle from!863 i!563))))

(declare-fun b!414664 () Bool)

(declare-fun e!247788 () Bool)

(declare-fun +!1179 (ListLongMap!5915 tuple2!7002) ListLongMap!5915)

(assert (=> b!414664 (= e!247788 (= call!28742 (+!1179 call!28741 (tuple2!7003 k!794 v!412))))))

(declare-fun b!414665 () Bool)

(declare-fun e!247791 () Bool)

(assert (=> b!414665 (= e!247789 (not e!247791))))

(declare-fun res!241124 () Bool)

(assert (=> b!414665 (=> res!241124 e!247791)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414665 (= res!241124 (validKeyInArray!0 (select (arr!12052 _keys!709) from!863)))))

(assert (=> b!414665 e!247788))

(assert (=> b!414665 (= c!54995 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12262 0))(
  ( (Unit!12263) )
))
(declare-fun lt!190056 () Unit!12262)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!389 (array!25205 array!25203 (_ BitVec 32) (_ BitVec 32) V!15335 V!15335 (_ BitVec 32) (_ BitVec 64) V!15335 (_ BitVec 32) Int) Unit!12262)

(assert (=> b!414665 (= lt!190056 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!389 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414666 () Bool)

(declare-fun e!247783 () Bool)

(assert (=> b!414666 (= e!247783 tp_is_empty!10673)))

(declare-fun b!414667 () Bool)

(assert (=> b!414667 (= e!247788 (= call!28741 call!28742))))

(declare-fun b!414668 () Bool)

(declare-fun res!241126 () Bool)

(assert (=> b!414668 (=> (not res!241126) (not e!247785))))

(assert (=> b!414668 (= res!241126 (validKeyInArray!0 k!794))))

(declare-fun b!414669 () Bool)

(assert (=> b!414669 (= e!247791 true)))

(declare-fun get!5943 (ValueCell!4993 V!15335) V!15335)

(declare-fun dynLambda!656 (Int (_ BitVec 64)) V!15335)

(assert (=> b!414669 (= lt!190054 (+!1179 (getCurrentListMapNoExtraKeys!1179 lt!190057 lt!190055 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7003 (select (arr!12052 lt!190057) from!863) (get!5943 (select (arr!12051 lt!190055) from!863) (dynLambda!656 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414670 () Bool)

(declare-fun res!241134 () Bool)

(assert (=> b!414670 (=> (not res!241134) (not e!247785))))

(assert (=> b!414670 (= res!241134 (or (= (select (arr!12052 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12052 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414671 () Bool)

(declare-fun res!241135 () Bool)

(assert (=> b!414671 (=> (not res!241135) (not e!247785))))

(assert (=> b!414671 (= res!241135 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7022))))

(declare-fun b!414672 () Bool)

(declare-fun res!241125 () Bool)

(assert (=> b!414672 (=> (not res!241125) (not e!247785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414672 (= res!241125 (validMask!0 mask!1025))))

(declare-fun b!414673 () Bool)

(declare-fun res!241131 () Bool)

(assert (=> b!414673 (=> (not res!241131) (not e!247785))))

(assert (=> b!414673 (= res!241131 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12404 _keys!709))))))

(declare-fun b!414674 () Bool)

(declare-fun res!241133 () Bool)

(assert (=> b!414674 (=> (not res!241133) (not e!247785))))

(assert (=> b!414674 (= res!241133 (and (= (size!12403 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12404 _keys!709) (size!12403 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414675 () Bool)

(assert (=> b!414675 (= e!247787 (and e!247783 mapRes!17631))))

(declare-fun condMapEmpty!17631 () Bool)

(declare-fun mapDefault!17631 () ValueCell!4993)

