; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38716 () Bool)

(assert start!38716)

(declare-fun b_free!9253 () Bool)

(declare-fun b_next!9253 () Bool)

(assert (=> start!38716 (= b_free!9253 (not b_next!9253))))

(declare-fun tp!32882 () Bool)

(declare-fun b_and!16639 () Bool)

(assert (=> start!38716 (= tp!32882 b_and!16639)))

(declare-fun b!402910 () Bool)

(declare-fun res!232131 () Bool)

(declare-fun e!242662 () Bool)

(assert (=> b!402910 (=> (not res!232131) (not e!242662))))

(declare-datatypes ((array!24175 0))(
  ( (array!24176 (arr!11537 (Array (_ BitVec 32) (_ BitVec 64))) (size!11889 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24175)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402910 (= res!232131 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!232130 () Bool)

(assert (=> start!38716 (=> (not res!232130) (not e!242662))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38716 (= res!232130 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11889 _keys!709))))))

(assert (=> start!38716 e!242662))

(declare-fun tp_is_empty!10135 () Bool)

(assert (=> start!38716 tp_is_empty!10135))

(assert (=> start!38716 tp!32882))

(assert (=> start!38716 true))

(declare-datatypes ((V!14619 0))(
  ( (V!14620 (val!5112 Int)) )
))
(declare-datatypes ((ValueCell!4724 0))(
  ( (ValueCellFull!4724 (v!7359 V!14619)) (EmptyCell!4724) )
))
(declare-datatypes ((array!24177 0))(
  ( (array!24178 (arr!11538 (Array (_ BitVec 32) ValueCell!4724)) (size!11890 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24177)

(declare-fun e!242663 () Bool)

(declare-fun array_inv!8440 (array!24177) Bool)

(assert (=> start!38716 (and (array_inv!8440 _values!549) e!242663)))

(declare-fun array_inv!8441 (array!24175) Bool)

(assert (=> start!38716 (array_inv!8441 _keys!709)))

(declare-fun b!402911 () Bool)

(declare-fun e!242661 () Bool)

(assert (=> b!402911 (= e!242661 tp_is_empty!10135)))

(declare-datatypes ((tuple2!6792 0))(
  ( (tuple2!6793 (_1!3407 (_ BitVec 64)) (_2!3407 V!14619)) )
))
(declare-datatypes ((List!6714 0))(
  ( (Nil!6711) (Cons!6710 (h!7566 tuple2!6792) (t!11888 List!6714)) )
))
(declare-datatypes ((ListLongMap!5705 0))(
  ( (ListLongMap!5706 (toList!2868 List!6714)) )
))
(declare-fun call!28423 () ListLongMap!5705)

(declare-fun v!412 () V!14619)

(declare-fun b!402912 () Bool)

(declare-fun e!242659 () Bool)

(declare-fun call!28424 () ListLongMap!5705)

(declare-fun +!1144 (ListLongMap!5705 tuple2!6792) ListLongMap!5705)

(assert (=> b!402912 (= e!242659 (= call!28423 (+!1144 call!28424 (tuple2!6793 k!794 v!412))))))

(declare-fun b!402913 () Bool)

(declare-fun res!232132 () Bool)

(assert (=> b!402913 (=> (not res!232132) (not e!242662))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!402913 (= res!232132 (and (= (size!11890 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11889 _keys!709) (size!11890 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402914 () Bool)

(declare-fun res!232129 () Bool)

(assert (=> b!402914 (=> (not res!232129) (not e!242662))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402914 (= res!232129 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11889 _keys!709))))))

(declare-fun b!402915 () Bool)

(declare-fun res!232135 () Bool)

(assert (=> b!402915 (=> (not res!232135) (not e!242662))))

(assert (=> b!402915 (= res!232135 (or (= (select (arr!11537 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11537 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402916 () Bool)

(assert (=> b!402916 (= e!242659 (= call!28424 call!28423))))

(declare-fun mapIsEmpty!16824 () Bool)

(declare-fun mapRes!16824 () Bool)

(assert (=> mapIsEmpty!16824 mapRes!16824))

(declare-fun b!402917 () Bool)

(declare-fun e!242658 () Bool)

(assert (=> b!402917 (= e!242658 (not true))))

(assert (=> b!402917 e!242659))

(declare-fun c!54836 () Bool)

(assert (=> b!402917 (= c!54836 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14619)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14619)

(declare-datatypes ((Unit!12196 0))(
  ( (Unit!12197) )
))
(declare-fun lt!187984 () Unit!12196)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!356 (array!24175 array!24177 (_ BitVec 32) (_ BitVec 32) V!14619 V!14619 (_ BitVec 32) (_ BitVec 64) V!14619 (_ BitVec 32) Int) Unit!12196)

(assert (=> b!402917 (= lt!187984 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!356 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402918 () Bool)

(declare-fun res!232134 () Bool)

(assert (=> b!402918 (=> (not res!232134) (not e!242658))))

(assert (=> b!402918 (= res!232134 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11889 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402919 () Bool)

(declare-fun e!242664 () Bool)

(assert (=> b!402919 (= e!242664 tp_is_empty!10135)))

(declare-fun b!402920 () Bool)

(declare-fun res!232126 () Bool)

(assert (=> b!402920 (=> (not res!232126) (not e!242662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402920 (= res!232126 (validMask!0 mask!1025))))

(declare-fun b!402921 () Bool)

(declare-fun res!232127 () Bool)

(assert (=> b!402921 (=> (not res!232127) (not e!242662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24175 (_ BitVec 32)) Bool)

(assert (=> b!402921 (= res!232127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!28420 () Bool)

(declare-fun lt!187985 () array!24175)

(declare-fun getCurrentListMapNoExtraKeys!1078 (array!24175 array!24177 (_ BitVec 32) (_ BitVec 32) V!14619 V!14619 (_ BitVec 32) Int) ListLongMap!5705)

(assert (=> bm!28420 (= call!28424 (getCurrentListMapNoExtraKeys!1078 (ite c!54836 _keys!709 lt!187985) (ite c!54836 _values!549 (array!24178 (store (arr!11538 _values!549) i!563 (ValueCellFull!4724 v!412)) (size!11890 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402922 () Bool)

(assert (=> b!402922 (= e!242662 e!242658)))

(declare-fun res!232133 () Bool)

(assert (=> b!402922 (=> (not res!232133) (not e!242658))))

(assert (=> b!402922 (= res!232133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187985 mask!1025))))

(assert (=> b!402922 (= lt!187985 (array!24176 (store (arr!11537 _keys!709) i!563 k!794) (size!11889 _keys!709)))))

(declare-fun b!402923 () Bool)

(assert (=> b!402923 (= e!242663 (and e!242661 mapRes!16824))))

(declare-fun condMapEmpty!16824 () Bool)

(declare-fun mapDefault!16824 () ValueCell!4724)

