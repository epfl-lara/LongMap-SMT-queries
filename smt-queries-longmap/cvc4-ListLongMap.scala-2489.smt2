; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38756 () Bool)

(assert start!38756)

(declare-fun b_free!9293 () Bool)

(declare-fun b_next!9293 () Bool)

(assert (=> start!38756 (= b_free!9293 (not b_next!9293))))

(declare-fun tp!33002 () Bool)

(declare-fun b_and!16679 () Bool)

(assert (=> start!38756 (= tp!33002 b_and!16679)))

(declare-fun b!403930 () Bool)

(declare-fun res!232847 () Bool)

(declare-fun e!243080 () Bool)

(assert (=> b!403930 (=> (not res!232847) (not e!243080))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403930 (= res!232847 (validKeyInArray!0 k!794))))

(declare-fun b!403931 () Bool)

(declare-fun res!232854 () Bool)

(assert (=> b!403931 (=> (not res!232854) (not e!243080))))

(declare-datatypes ((array!24247 0))(
  ( (array!24248 (arr!11573 (Array (_ BitVec 32) (_ BitVec 64))) (size!11925 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24247)

(declare-fun arrayContainsKey!0 (array!24247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403931 (= res!232854 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!403932 () Bool)

(declare-fun res!232853 () Bool)

(declare-fun e!243079 () Bool)

(assert (=> b!403932 (=> (not res!232853) (not e!243079))))

(declare-fun lt!188105 () array!24247)

(declare-datatypes ((List!6741 0))(
  ( (Nil!6738) (Cons!6737 (h!7593 (_ BitVec 64)) (t!11915 List!6741)) )
))
(declare-fun arrayNoDuplicates!0 (array!24247 (_ BitVec 32) List!6741) Bool)

(assert (=> b!403932 (= res!232853 (arrayNoDuplicates!0 lt!188105 #b00000000000000000000000000000000 Nil!6738))))

(declare-fun b!403934 () Bool)

(declare-fun res!232846 () Bool)

(assert (=> b!403934 (=> (not res!232846) (not e!243080))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403934 (= res!232846 (validMask!0 mask!1025))))

(declare-fun b!403935 () Bool)

(declare-fun res!232855 () Bool)

(assert (=> b!403935 (=> (not res!232855) (not e!243080))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403935 (= res!232855 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11925 _keys!709))))))

(declare-fun b!403936 () Bool)

(declare-fun res!232856 () Bool)

(assert (=> b!403936 (=> (not res!232856) (not e!243079))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!403936 (= res!232856 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11925 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16884 () Bool)

(declare-fun mapRes!16884 () Bool)

(assert (=> mapIsEmpty!16884 mapRes!16884))

(declare-fun b!403937 () Bool)

(declare-fun res!232851 () Bool)

(assert (=> b!403937 (=> (not res!232851) (not e!243080))))

(assert (=> b!403937 (= res!232851 (or (= (select (arr!11573 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11573 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403938 () Bool)

(assert (=> b!403938 (= e!243079 (not true))))

(declare-fun e!243084 () Bool)

(assert (=> b!403938 e!243084))

(declare-fun c!54896 () Bool)

(assert (=> b!403938 (= c!54896 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14671 0))(
  ( (V!14672 (val!5132 Int)) )
))
(declare-fun minValue!515 () V!14671)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14671)

(declare-datatypes ((Unit!12218 0))(
  ( (Unit!12219) )
))
(declare-fun lt!188104 () Unit!12218)

(declare-fun v!412 () V!14671)

(declare-datatypes ((ValueCell!4744 0))(
  ( (ValueCellFull!4744 (v!7379 V!14671)) (EmptyCell!4744) )
))
(declare-datatypes ((array!24249 0))(
  ( (array!24250 (arr!11574 (Array (_ BitVec 32) ValueCell!4744)) (size!11926 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24249)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!367 (array!24247 array!24249 (_ BitVec 32) (_ BitVec 32) V!14671 V!14671 (_ BitVec 32) (_ BitVec 64) V!14671 (_ BitVec 32) Int) Unit!12218)

(assert (=> b!403938 (= lt!188104 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!367 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403939 () Bool)

(declare-datatypes ((tuple2!6824 0))(
  ( (tuple2!6825 (_1!3423 (_ BitVec 64)) (_2!3423 V!14671)) )
))
(declare-datatypes ((List!6742 0))(
  ( (Nil!6739) (Cons!6738 (h!7594 tuple2!6824) (t!11916 List!6742)) )
))
(declare-datatypes ((ListLongMap!5737 0))(
  ( (ListLongMap!5738 (toList!2884 List!6742)) )
))
(declare-fun call!28543 () ListLongMap!5737)

(declare-fun call!28544 () ListLongMap!5737)

(assert (=> b!403939 (= e!243084 (= call!28543 call!28544))))

(declare-fun bm!28540 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1092 (array!24247 array!24249 (_ BitVec 32) (_ BitVec 32) V!14671 V!14671 (_ BitVec 32) Int) ListLongMap!5737)

(assert (=> bm!28540 (= call!28544 (getCurrentListMapNoExtraKeys!1092 (ite c!54896 lt!188105 _keys!709) (ite c!54896 (array!24250 (store (arr!11574 _values!549) i!563 (ValueCellFull!4744 v!412)) (size!11926 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403940 () Bool)

(assert (=> b!403940 (= e!243080 e!243079)))

(declare-fun res!232857 () Bool)

(assert (=> b!403940 (=> (not res!232857) (not e!243079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24247 (_ BitVec 32)) Bool)

(assert (=> b!403940 (= res!232857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188105 mask!1025))))

(assert (=> b!403940 (= lt!188105 (array!24248 (store (arr!11573 _keys!709) i!563 k!794) (size!11925 _keys!709)))))

(declare-fun b!403941 () Bool)

(declare-fun e!243078 () Bool)

(declare-fun e!243082 () Bool)

(assert (=> b!403941 (= e!243078 (and e!243082 mapRes!16884))))

(declare-fun condMapEmpty!16884 () Bool)

(declare-fun mapDefault!16884 () ValueCell!4744)

