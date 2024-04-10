; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38584 () Bool)

(assert start!38584)

(declare-fun b_free!9121 () Bool)

(declare-fun b_next!9121 () Bool)

(assert (=> start!38584 (= b_free!9121 (not b_next!9121))))

(declare-fun tp!32487 () Bool)

(declare-fun b_and!16507 () Bool)

(assert (=> start!38584 (= tp!32487 b_and!16507)))

(declare-fun b!399544 () Bool)

(declare-fun e!241274 () Bool)

(declare-fun e!241276 () Bool)

(assert (=> b!399544 (= e!241274 e!241276)))

(declare-fun res!229761 () Bool)

(assert (=> b!399544 (=> (not res!229761) (not e!241276))))

(declare-datatypes ((array!23917 0))(
  ( (array!23918 (arr!11408 (Array (_ BitVec 32) (_ BitVec 64))) (size!11760 (_ BitVec 32))) )
))
(declare-fun lt!187588 () array!23917)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23917 (_ BitVec 32)) Bool)

(assert (=> b!399544 (= res!229761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187588 mask!1025))))

(declare-fun _keys!709 () array!23917)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399544 (= lt!187588 (array!23918 (store (arr!11408 _keys!709) i!563 k!794) (size!11760 _keys!709)))))

(declare-fun b!399545 () Bool)

(declare-fun res!229757 () Bool)

(assert (=> b!399545 (=> (not res!229757) (not e!241274))))

(assert (=> b!399545 (= res!229757 (or (= (select (arr!11408 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11408 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399546 () Bool)

(declare-fun res!229759 () Bool)

(assert (=> b!399546 (=> (not res!229759) (not e!241274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399546 (= res!229759 (validKeyInArray!0 k!794))))

(declare-fun b!399547 () Bool)

(assert (=> b!399547 (= e!241276 (not true))))

(declare-fun e!241272 () Bool)

(assert (=> b!399547 e!241272))

(declare-fun c!54638 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!399547 (= c!54638 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14443 0))(
  ( (V!14444 (val!5046 Int)) )
))
(declare-fun minValue!515 () V!14443)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!4658 0))(
  ( (ValueCellFull!4658 (v!7293 V!14443)) (EmptyCell!4658) )
))
(declare-datatypes ((array!23919 0))(
  ( (array!23920 (arr!11409 (Array (_ BitVec 32) ValueCell!4658)) (size!11761 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23919)

(declare-fun zeroValue!515 () V!14443)

(declare-fun v!412 () V!14443)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12108 0))(
  ( (Unit!12109) )
))
(declare-fun lt!187589 () Unit!12108)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!312 (array!23917 array!23919 (_ BitVec 32) (_ BitVec 32) V!14443 V!14443 (_ BitVec 32) (_ BitVec 64) V!14443 (_ BitVec 32) Int) Unit!12108)

(assert (=> b!399547 (= lt!187589 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!312 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399548 () Bool)

(declare-fun res!229754 () Bool)

(assert (=> b!399548 (=> (not res!229754) (not e!241274))))

(assert (=> b!399548 (= res!229754 (and (= (size!11761 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11760 _keys!709) (size!11761 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399549 () Bool)

(declare-fun e!241277 () Bool)

(declare-fun e!241278 () Bool)

(declare-fun mapRes!16626 () Bool)

(assert (=> b!399549 (= e!241277 (and e!241278 mapRes!16626))))

(declare-fun condMapEmpty!16626 () Bool)

(declare-fun mapDefault!16626 () ValueCell!4658)

