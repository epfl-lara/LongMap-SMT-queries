; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97440 () Bool)

(assert start!97440)

(declare-fun b_free!23411 () Bool)

(declare-fun b_next!23411 () Bool)

(assert (=> start!97440 (= b_free!23411 (not b_next!23411))))

(declare-fun tp!82531 () Bool)

(declare-fun b_and!37659 () Bool)

(assert (=> start!97440 (= tp!82531 b_and!37659)))

(declare-fun b!1111681 () Bool)

(declare-fun e!633885 () Bool)

(declare-fun tp_is_empty!27671 () Bool)

(assert (=> b!1111681 (= e!633885 tp_is_empty!27671)))

(declare-fun b!1111682 () Bool)

(declare-fun e!633886 () Bool)

(declare-fun e!633891 () Bool)

(assert (=> b!1111682 (= e!633886 (not e!633891))))

(declare-fun res!741846 () Bool)

(assert (=> b!1111682 (=> res!741846 e!633891)))

(declare-datatypes ((array!72259 0))(
  ( (array!72260 (arr!34782 (Array (_ BitVec 32) (_ BitVec 64))) (size!35318 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72259)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1111682 (= res!741846 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35318 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111682 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36484 0))(
  ( (Unit!36485) )
))
(declare-fun lt!496386 () Unit!36484)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72259 (_ BitVec 64) (_ BitVec 32)) Unit!36484)

(assert (=> b!1111682 (= lt!496386 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1111683 () Bool)

(declare-fun e!633887 () Bool)

(assert (=> b!1111683 (= e!633887 e!633886)))

(declare-fun res!741854 () Bool)

(assert (=> b!1111683 (=> (not res!741854) (not e!633886))))

(declare-fun lt!496388 () array!72259)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72259 (_ BitVec 32)) Bool)

(assert (=> b!1111683 (= res!741854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496388 mask!1564))))

(assert (=> b!1111683 (= lt!496388 (array!72260 (store (arr!34782 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35318 _keys!1208)))))

(declare-fun b!1111684 () Bool)

(declare-fun res!741849 () Bool)

(assert (=> b!1111684 (=> (not res!741849) (not e!633887))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42021 0))(
  ( (V!42022 (val!13892 Int)) )
))
(declare-datatypes ((ValueCell!13126 0))(
  ( (ValueCellFull!13126 (v!16525 V!42021)) (EmptyCell!13126) )
))
(declare-datatypes ((array!72261 0))(
  ( (array!72262 (arr!34783 (Array (_ BitVec 32) ValueCell!13126)) (size!35319 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72261)

(assert (=> b!1111684 (= res!741849 (and (= (size!35319 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35318 _keys!1208) (size!35319 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111685 () Bool)

(declare-fun res!741851 () Bool)

(assert (=> b!1111685 (=> (not res!741851) (not e!633887))))

(declare-datatypes ((List!24268 0))(
  ( (Nil!24265) (Cons!24264 (h!25473 (_ BitVec 64)) (t!34725 List!24268)) )
))
(declare-fun arrayNoDuplicates!0 (array!72259 (_ BitVec 32) List!24268) Bool)

(assert (=> b!1111685 (= res!741851 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24265))))

(declare-fun b!1111686 () Bool)

(declare-fun e!633884 () Bool)

(assert (=> b!1111686 (= e!633884 tp_is_empty!27671)))

(declare-fun b!1111687 () Bool)

(declare-fun res!741850 () Bool)

(assert (=> b!1111687 (=> (not res!741850) (not e!633887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111687 (= res!741850 (validKeyInArray!0 k!934))))

(declare-fun b!1111688 () Bool)

(declare-fun res!741848 () Bool)

(assert (=> b!1111688 (=> (not res!741848) (not e!633887))))

(assert (=> b!1111688 (= res!741848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111689 () Bool)

(declare-fun res!741853 () Bool)

(assert (=> b!1111689 (=> (not res!741853) (not e!633887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111689 (= res!741853 (validMask!0 mask!1564))))

(declare-fun b!1111690 () Bool)

(declare-fun res!741856 () Bool)

(assert (=> b!1111690 (=> (not res!741856) (not e!633887))))

(assert (=> b!1111690 (= res!741856 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35318 _keys!1208))))))

(declare-fun b!1111691 () Bool)

(assert (=> b!1111691 (= e!633891 true)))

(declare-fun e!633889 () Bool)

(assert (=> b!1111691 e!633889))

(declare-fun c!109314 () Bool)

(assert (=> b!1111691 (= c!109314 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42021)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42021)

(declare-fun lt!496387 () Unit!36484)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!307 (array!72259 array!72261 (_ BitVec 32) (_ BitVec 32) V!42021 V!42021 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36484)

(assert (=> b!1111691 (= lt!496387 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!307 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111692 () Bool)

(declare-fun e!633888 () Bool)

(declare-fun mapRes!43324 () Bool)

(assert (=> b!1111692 (= e!633888 (and e!633885 mapRes!43324))))

(declare-fun condMapEmpty!43324 () Bool)

(declare-fun mapDefault!43324 () ValueCell!13126)

