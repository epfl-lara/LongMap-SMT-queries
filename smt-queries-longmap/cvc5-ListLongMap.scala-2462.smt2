; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38590 () Bool)

(assert start!38590)

(declare-fun b_free!9127 () Bool)

(declare-fun b_next!9127 () Bool)

(assert (=> start!38590 (= b_free!9127 (not b_next!9127))))

(declare-fun tp!32504 () Bool)

(declare-fun b_and!16513 () Bool)

(assert (=> start!38590 (= tp!32504 b_and!16513)))

(declare-fun b!399697 () Bool)

(declare-fun e!241340 () Bool)

(assert (=> b!399697 (= e!241340 (not true))))

(declare-fun e!241338 () Bool)

(assert (=> b!399697 e!241338))

(declare-fun c!54647 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399697 (= c!54647 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14451 0))(
  ( (V!14452 (val!5049 Int)) )
))
(declare-fun minValue!515 () V!14451)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4661 0))(
  ( (ValueCellFull!4661 (v!7296 V!14451)) (EmptyCell!4661) )
))
(declare-datatypes ((array!23929 0))(
  ( (array!23930 (arr!11414 (Array (_ BitVec 32) ValueCell!4661)) (size!11766 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23929)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!14451)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!23931 0))(
  ( (array!23932 (arr!11415 (Array (_ BitVec 32) (_ BitVec 64))) (size!11767 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23931)

(declare-fun zeroValue!515 () V!14451)

(declare-datatypes ((Unit!12114 0))(
  ( (Unit!12115) )
))
(declare-fun lt!187607 () Unit!12114)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!315 (array!23931 array!23929 (_ BitVec 32) (_ BitVec 32) V!14451 V!14451 (_ BitVec 32) (_ BitVec 64) V!14451 (_ BitVec 32) Int) Unit!12114)

(assert (=> b!399697 (= lt!187607 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!315 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((tuple2!6686 0))(
  ( (tuple2!6687 (_1!3354 (_ BitVec 64)) (_2!3354 V!14451)) )
))
(declare-datatypes ((List!6612 0))(
  ( (Nil!6609) (Cons!6608 (h!7464 tuple2!6686) (t!11786 List!6612)) )
))
(declare-datatypes ((ListLongMap!5599 0))(
  ( (ListLongMap!5600 (toList!2815 List!6612)) )
))
(declare-fun call!28045 () ListLongMap!5599)

(declare-fun bm!28042 () Bool)

(declare-fun lt!187606 () array!23931)

(declare-fun getCurrentListMapNoExtraKeys!1032 (array!23931 array!23929 (_ BitVec 32) (_ BitVec 32) V!14451 V!14451 (_ BitVec 32) Int) ListLongMap!5599)

(assert (=> bm!28042 (= call!28045 (getCurrentListMapNoExtraKeys!1032 (ite c!54647 _keys!709 lt!187606) (ite c!54647 _values!549 (array!23930 (store (arr!11414 _values!549) i!563 (ValueCellFull!4661 v!412)) (size!11766 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399698 () Bool)

(declare-fun res!229867 () Bool)

(declare-fun e!241339 () Bool)

(assert (=> b!399698 (=> (not res!229867) (not e!241339))))

(declare-datatypes ((List!6613 0))(
  ( (Nil!6610) (Cons!6609 (h!7465 (_ BitVec 64)) (t!11787 List!6613)) )
))
(declare-fun arrayNoDuplicates!0 (array!23931 (_ BitVec 32) List!6613) Bool)

(assert (=> b!399698 (= res!229867 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6610))))

(declare-fun mapNonEmpty!16635 () Bool)

(declare-fun mapRes!16635 () Bool)

(declare-fun tp!32505 () Bool)

(declare-fun e!241341 () Bool)

(assert (=> mapNonEmpty!16635 (= mapRes!16635 (and tp!32505 e!241341))))

(declare-fun mapRest!16635 () (Array (_ BitVec 32) ValueCell!4661))

(declare-fun mapKey!16635 () (_ BitVec 32))

(declare-fun mapValue!16635 () ValueCell!4661)

(assert (=> mapNonEmpty!16635 (= (arr!11414 _values!549) (store mapRest!16635 mapKey!16635 mapValue!16635))))

(declare-fun b!399699 () Bool)

(declare-fun e!241336 () Bool)

(declare-fun tp_is_empty!10009 () Bool)

(assert (=> b!399699 (= e!241336 tp_is_empty!10009)))

(declare-fun res!229861 () Bool)

(assert (=> start!38590 (=> (not res!229861) (not e!241339))))

(assert (=> start!38590 (= res!229861 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11767 _keys!709))))))

(assert (=> start!38590 e!241339))

(assert (=> start!38590 tp_is_empty!10009))

(assert (=> start!38590 tp!32504))

(assert (=> start!38590 true))

(declare-fun e!241335 () Bool)

(declare-fun array_inv!8362 (array!23929) Bool)

(assert (=> start!38590 (and (array_inv!8362 _values!549) e!241335)))

(declare-fun array_inv!8363 (array!23931) Bool)

(assert (=> start!38590 (array_inv!8363 _keys!709)))

(declare-fun b!399700 () Bool)

(declare-fun res!229865 () Bool)

(assert (=> b!399700 (=> (not res!229865) (not e!241340))))

(assert (=> b!399700 (= res!229865 (arrayNoDuplicates!0 lt!187606 #b00000000000000000000000000000000 Nil!6610))))

(declare-fun b!399701 () Bool)

(declare-fun res!229858 () Bool)

(assert (=> b!399701 (=> (not res!229858) (not e!241339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399701 (= res!229858 (validMask!0 mask!1025))))

(declare-fun b!399702 () Bool)

(assert (=> b!399702 (= e!241341 tp_is_empty!10009)))

(declare-fun b!399703 () Bool)

(declare-fun res!229862 () Bool)

(assert (=> b!399703 (=> (not res!229862) (not e!241339))))

(declare-fun arrayContainsKey!0 (array!23931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399703 (= res!229862 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!399704 () Bool)

(declare-fun res!229868 () Bool)

(assert (=> b!399704 (=> (not res!229868) (not e!241339))))

(assert (=> b!399704 (= res!229868 (and (= (size!11766 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11767 _keys!709) (size!11766 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun call!28046 () ListLongMap!5599)

(declare-fun bm!28043 () Bool)

(assert (=> bm!28043 (= call!28046 (getCurrentListMapNoExtraKeys!1032 (ite c!54647 lt!187606 _keys!709) (ite c!54647 (array!23930 (store (arr!11414 _values!549) i!563 (ValueCellFull!4661 v!412)) (size!11766 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399705 () Bool)

(assert (=> b!399705 (= e!241339 e!241340)))

(declare-fun res!229869 () Bool)

(assert (=> b!399705 (=> (not res!229869) (not e!241340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23931 (_ BitVec 32)) Bool)

(assert (=> b!399705 (= res!229869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187606 mask!1025))))

(assert (=> b!399705 (= lt!187606 (array!23932 (store (arr!11415 _keys!709) i!563 k!794) (size!11767 _keys!709)))))

(declare-fun b!399706 () Bool)

(declare-fun res!229866 () Bool)

(assert (=> b!399706 (=> (not res!229866) (not e!241339))))

(assert (=> b!399706 (= res!229866 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11767 _keys!709))))))

(declare-fun b!399707 () Bool)

(assert (=> b!399707 (= e!241338 (= call!28045 call!28046))))

(declare-fun b!399708 () Bool)

(declare-fun +!1103 (ListLongMap!5599 tuple2!6686) ListLongMap!5599)

(assert (=> b!399708 (= e!241338 (= call!28046 (+!1103 call!28045 (tuple2!6687 k!794 v!412))))))

(declare-fun b!399709 () Bool)

(assert (=> b!399709 (= e!241335 (and e!241336 mapRes!16635))))

(declare-fun condMapEmpty!16635 () Bool)

(declare-fun mapDefault!16635 () ValueCell!4661)

