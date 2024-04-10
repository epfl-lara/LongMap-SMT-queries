; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38708 () Bool)

(assert start!38708)

(declare-fun b_free!9245 () Bool)

(declare-fun b_next!9245 () Bool)

(assert (=> start!38708 (= b_free!9245 (not b_next!9245))))

(declare-fun tp!32858 () Bool)

(declare-fun b_and!16631 () Bool)

(assert (=> start!38708 (= tp!32858 b_and!16631)))

(declare-fun b!402706 () Bool)

(declare-fun e!242577 () Bool)

(declare-fun e!242578 () Bool)

(assert (=> b!402706 (= e!242577 e!242578)))

(declare-fun res!231989 () Bool)

(assert (=> b!402706 (=> (not res!231989) (not e!242578))))

(declare-datatypes ((array!24159 0))(
  ( (array!24160 (arr!11529 (Array (_ BitVec 32) (_ BitVec 64))) (size!11881 (_ BitVec 32))) )
))
(declare-fun lt!187960 () array!24159)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24159 (_ BitVec 32)) Bool)

(assert (=> b!402706 (= res!231989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187960 mask!1025))))

(declare-fun _keys!709 () array!24159)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402706 (= lt!187960 (array!24160 (store (arr!11529 _keys!709) i!563 k!794) (size!11881 _keys!709)))))

(declare-datatypes ((V!14607 0))(
  ( (V!14608 (val!5108 Int)) )
))
(declare-fun minValue!515 () V!14607)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4720 0))(
  ( (ValueCellFull!4720 (v!7355 V!14607)) (EmptyCell!4720) )
))
(declare-datatypes ((array!24161 0))(
  ( (array!24162 (arr!11530 (Array (_ BitVec 32) ValueCell!4720)) (size!11882 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24161)

(declare-datatypes ((tuple2!6786 0))(
  ( (tuple2!6787 (_1!3404 (_ BitVec 64)) (_2!3404 V!14607)) )
))
(declare-datatypes ((List!6708 0))(
  ( (Nil!6705) (Cons!6704 (h!7560 tuple2!6786) (t!11882 List!6708)) )
))
(declare-datatypes ((ListLongMap!5699 0))(
  ( (ListLongMap!5700 (toList!2865 List!6708)) )
))
(declare-fun call!28400 () ListLongMap!5699)

(declare-fun zeroValue!515 () V!14607)

(declare-fun c!54824 () Bool)

(declare-fun bm!28396 () Bool)

(declare-fun v!412 () V!14607)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1075 (array!24159 array!24161 (_ BitVec 32) (_ BitVec 32) V!14607 V!14607 (_ BitVec 32) Int) ListLongMap!5699)

(assert (=> bm!28396 (= call!28400 (getCurrentListMapNoExtraKeys!1075 (ite c!54824 _keys!709 lt!187960) (ite c!54824 _values!549 (array!24162 (store (arr!11530 _values!549) i!563 (ValueCellFull!4720 v!412)) (size!11882 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16812 () Bool)

(declare-fun mapRes!16812 () Bool)

(declare-fun tp!32859 () Bool)

(declare-fun e!242580 () Bool)

(assert (=> mapNonEmpty!16812 (= mapRes!16812 (and tp!32859 e!242580))))

(declare-fun mapKey!16812 () (_ BitVec 32))

(declare-fun mapValue!16812 () ValueCell!4720)

(declare-fun mapRest!16812 () (Array (_ BitVec 32) ValueCell!4720))

(assert (=> mapNonEmpty!16812 (= (arr!11530 _values!549) (store mapRest!16812 mapKey!16812 mapValue!16812))))

(declare-fun b!402707 () Bool)

(declare-fun res!231988 () Bool)

(assert (=> b!402707 (=> (not res!231988) (not e!242577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402707 (= res!231988 (validMask!0 mask!1025))))

(declare-fun b!402708 () Bool)

(declare-fun tp_is_empty!10127 () Bool)

(assert (=> b!402708 (= e!242580 tp_is_empty!10127)))

(declare-fun res!231983 () Bool)

(assert (=> start!38708 (=> (not res!231983) (not e!242577))))

(assert (=> start!38708 (= res!231983 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11881 _keys!709))))))

(assert (=> start!38708 e!242577))

(assert (=> start!38708 tp_is_empty!10127))

(assert (=> start!38708 tp!32858))

(assert (=> start!38708 true))

(declare-fun e!242575 () Bool)

(declare-fun array_inv!8436 (array!24161) Bool)

(assert (=> start!38708 (and (array_inv!8436 _values!549) e!242575)))

(declare-fun array_inv!8437 (array!24159) Bool)

(assert (=> start!38708 (array_inv!8437 _keys!709)))

(declare-fun b!402709 () Bool)

(declare-fun res!231985 () Bool)

(assert (=> b!402709 (=> (not res!231985) (not e!242578))))

(assert (=> b!402709 (= res!231985 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11881 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402710 () Bool)

(declare-fun res!231987 () Bool)

(assert (=> b!402710 (=> (not res!231987) (not e!242577))))

(declare-datatypes ((List!6709 0))(
  ( (Nil!6706) (Cons!6705 (h!7561 (_ BitVec 64)) (t!11883 List!6709)) )
))
(declare-fun arrayNoDuplicates!0 (array!24159 (_ BitVec 32) List!6709) Bool)

(assert (=> b!402710 (= res!231987 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6706))))

(declare-fun e!242579 () Bool)

(declare-fun call!28399 () ListLongMap!5699)

(declare-fun b!402711 () Bool)

(declare-fun +!1141 (ListLongMap!5699 tuple2!6786) ListLongMap!5699)

(assert (=> b!402711 (= e!242579 (= call!28399 (+!1141 call!28400 (tuple2!6787 k!794 v!412))))))

(declare-fun mapIsEmpty!16812 () Bool)

(assert (=> mapIsEmpty!16812 mapRes!16812))

(declare-fun b!402712 () Bool)

(declare-fun res!231991 () Bool)

(assert (=> b!402712 (=> (not res!231991) (not e!242577))))

(assert (=> b!402712 (= res!231991 (and (= (size!11882 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11881 _keys!709) (size!11882 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402713 () Bool)

(declare-fun res!231984 () Bool)

(assert (=> b!402713 (=> (not res!231984) (not e!242577))))

(declare-fun arrayContainsKey!0 (array!24159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402713 (= res!231984 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!402714 () Bool)

(declare-fun e!242576 () Bool)

(assert (=> b!402714 (= e!242575 (and e!242576 mapRes!16812))))

(declare-fun condMapEmpty!16812 () Bool)

(declare-fun mapDefault!16812 () ValueCell!4720)

