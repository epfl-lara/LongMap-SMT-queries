; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38752 () Bool)

(assert start!38752)

(declare-fun b_free!9289 () Bool)

(declare-fun b_next!9289 () Bool)

(assert (=> start!38752 (= b_free!9289 (not b_next!9289))))

(declare-fun tp!32991 () Bool)

(declare-fun b_and!16675 () Bool)

(assert (=> start!38752 (= tp!32991 b_and!16675)))

(declare-fun res!232781 () Bool)

(declare-fun e!243040 () Bool)

(assert (=> start!38752 (=> (not res!232781) (not e!243040))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24239 0))(
  ( (array!24240 (arr!11569 (Array (_ BitVec 32) (_ BitVec 64))) (size!11921 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24239)

(assert (=> start!38752 (= res!232781 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11921 _keys!709))))))

(assert (=> start!38752 e!243040))

(declare-fun tp_is_empty!10171 () Bool)

(assert (=> start!38752 tp_is_empty!10171))

(assert (=> start!38752 tp!32991))

(assert (=> start!38752 true))

(declare-datatypes ((V!14667 0))(
  ( (V!14668 (val!5130 Int)) )
))
(declare-datatypes ((ValueCell!4742 0))(
  ( (ValueCellFull!4742 (v!7377 V!14667)) (EmptyCell!4742) )
))
(declare-datatypes ((array!24241 0))(
  ( (array!24242 (arr!11570 (Array (_ BitVec 32) ValueCell!4742)) (size!11922 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24241)

(declare-fun e!243038 () Bool)

(declare-fun array_inv!8464 (array!24241) Bool)

(assert (=> start!38752 (and (array_inv!8464 _values!549) e!243038)))

(declare-fun array_inv!8465 (array!24239) Bool)

(assert (=> start!38752 (array_inv!8465 _keys!709)))

(declare-fun mapIsEmpty!16878 () Bool)

(declare-fun mapRes!16878 () Bool)

(assert (=> mapIsEmpty!16878 mapRes!16878))

(declare-fun b!403828 () Bool)

(declare-fun e!243041 () Bool)

(assert (=> b!403828 (= e!243041 tp_is_empty!10171)))

(declare-fun b!403829 () Bool)

(declare-fun e!243037 () Bool)

(assert (=> b!403829 (= e!243037 tp_is_empty!10171)))

(declare-datatypes ((tuple2!6820 0))(
  ( (tuple2!6821 (_1!3421 (_ BitVec 64)) (_2!3421 V!14667)) )
))
(declare-datatypes ((List!6738 0))(
  ( (Nil!6735) (Cons!6734 (h!7590 tuple2!6820) (t!11912 List!6738)) )
))
(declare-datatypes ((ListLongMap!5733 0))(
  ( (ListLongMap!5734 (toList!2882 List!6738)) )
))
(declare-fun call!28531 () ListLongMap!5733)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun call!28532 () ListLongMap!5733)

(declare-fun e!243042 () Bool)

(declare-fun b!403830 () Bool)

(declare-fun v!412 () V!14667)

(declare-fun +!1156 (ListLongMap!5733 tuple2!6820) ListLongMap!5733)

(assert (=> b!403830 (= e!243042 (= call!28532 (+!1156 call!28531 (tuple2!6821 k!794 v!412))))))

(declare-fun b!403831 () Bool)

(declare-fun res!232775 () Bool)

(assert (=> b!403831 (=> (not res!232775) (not e!243040))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!403831 (= res!232775 (and (= (size!11922 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11921 _keys!709) (size!11922 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403832 () Bool)

(declare-fun res!232784 () Bool)

(assert (=> b!403832 (=> (not res!232784) (not e!243040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24239 (_ BitVec 32)) Bool)

(assert (=> b!403832 (= res!232784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403833 () Bool)

(declare-fun e!243036 () Bool)

(assert (=> b!403833 (= e!243036 (not true))))

(assert (=> b!403833 e!243042))

(declare-fun c!54890 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403833 (= c!54890 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14667)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14667)

(declare-datatypes ((Unit!12214 0))(
  ( (Unit!12215) )
))
(declare-fun lt!188093 () Unit!12214)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!365 (array!24239 array!24241 (_ BitVec 32) (_ BitVec 32) V!14667 V!14667 (_ BitVec 32) (_ BitVec 64) V!14667 (_ BitVec 32) Int) Unit!12214)

(assert (=> b!403833 (= lt!188093 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!365 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403834 () Bool)

(assert (=> b!403834 (= e!243038 (and e!243041 mapRes!16878))))

(declare-fun condMapEmpty!16878 () Bool)

(declare-fun mapDefault!16878 () ValueCell!4742)

