; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40680 () Bool)

(assert start!40680)

(declare-fun b_free!10691 () Bool)

(declare-fun b_next!10691 () Bool)

(assert (=> start!40680 (= b_free!10691 (not b_next!10691))))

(declare-fun tp!37893 () Bool)

(declare-fun b_and!18699 () Bool)

(assert (=> start!40680 (= tp!37893 b_and!18699)))

(declare-fun b!449717 () Bool)

(declare-fun e!263637 () Bool)

(declare-fun tp_is_empty!12029 () Bool)

(assert (=> b!449717 (= e!263637 tp_is_empty!12029)))

(declare-fun b!449718 () Bool)

(declare-fun res!267564 () Bool)

(declare-fun e!263640 () Bool)

(assert (=> b!449718 (=> (not res!267564) (not e!263640))))

(declare-datatypes ((array!27865 0))(
  ( (array!27866 (arr!13378 (Array (_ BitVec 32) (_ BitVec 64))) (size!13730 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27865)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27865 (_ BitVec 32)) Bool)

(assert (=> b!449718 (= res!267564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449719 () Bool)

(declare-fun res!267558 () Bool)

(assert (=> b!449719 (=> (not res!267558) (not e!263640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449719 (= res!267558 (validMask!0 mask!1025))))

(declare-fun b!449720 () Bool)

(declare-fun res!267561 () Bool)

(assert (=> b!449720 (=> (not res!267561) (not e!263640))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449720 (= res!267561 (or (= (select (arr!13378 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13378 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449721 () Bool)

(declare-fun res!267560 () Bool)

(assert (=> b!449721 (=> (not res!267560) (not e!263640))))

(declare-datatypes ((List!8023 0))(
  ( (Nil!8020) (Cons!8019 (h!8875 (_ BitVec 64)) (t!13785 List!8023)) )
))
(declare-fun arrayNoDuplicates!0 (array!27865 (_ BitVec 32) List!8023) Bool)

(assert (=> b!449721 (= res!267560 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8020))))

(declare-fun b!449722 () Bool)

(declare-fun e!263642 () Bool)

(assert (=> b!449722 (= e!263640 e!263642)))

(declare-fun res!267565 () Bool)

(assert (=> b!449722 (=> (not res!267565) (not e!263642))))

(declare-fun lt!204422 () array!27865)

(assert (=> b!449722 (= res!267565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204422 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!449722 (= lt!204422 (array!27866 (store (arr!13378 _keys!709) i!563 k!794) (size!13730 _keys!709)))))

(declare-fun b!449723 () Bool)

(declare-fun res!267557 () Bool)

(assert (=> b!449723 (=> (not res!267557) (not e!263640))))

(assert (=> b!449723 (= res!267557 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13730 _keys!709))))))

(declare-fun b!449724 () Bool)

(declare-fun res!267562 () Bool)

(assert (=> b!449724 (=> (not res!267562) (not e!263642))))

(assert (=> b!449724 (= res!267562 (arrayNoDuplicates!0 lt!204422 #b00000000000000000000000000000000 Nil!8020))))

(declare-fun b!449725 () Bool)

(declare-fun e!263639 () Bool)

(declare-fun mapRes!19677 () Bool)

(assert (=> b!449725 (= e!263639 (and e!263637 mapRes!19677))))

(declare-fun condMapEmpty!19677 () Bool)

(declare-datatypes ((V!17143 0))(
  ( (V!17144 (val!6059 Int)) )
))
(declare-datatypes ((ValueCell!5671 0))(
  ( (ValueCellFull!5671 (v!8314 V!17143)) (EmptyCell!5671) )
))
(declare-datatypes ((array!27867 0))(
  ( (array!27868 (arr!13379 (Array (_ BitVec 32) ValueCell!5671)) (size!13731 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27867)

(declare-fun mapDefault!19677 () ValueCell!5671)

