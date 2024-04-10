; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41134 () Bool)

(assert start!41134)

(declare-fun b_free!11003 () Bool)

(declare-fun b_next!11003 () Bool)

(assert (=> start!41134 (= b_free!11003 (not b_next!11003))))

(declare-fun tp!38845 () Bool)

(declare-fun b_and!19245 () Bool)

(assert (=> start!41134 (= tp!38845 b_and!19245)))

(declare-fun b!458930 () Bool)

(declare-fun e!267917 () Bool)

(declare-fun e!267916 () Bool)

(assert (=> b!458930 (= e!267917 (not e!267916))))

(declare-fun res!274203 () Bool)

(assert (=> b!458930 (=> res!274203 e!267916)))

(declare-datatypes ((array!28483 0))(
  ( (array!28484 (arr!13682 (Array (_ BitVec 32) (_ BitVec 64))) (size!14034 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28483)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458930 (= res!274203 (not (validKeyInArray!0 (select (arr!13682 _keys!709) from!863))))))

(declare-datatypes ((V!17559 0))(
  ( (V!17560 (val!6215 Int)) )
))
(declare-datatypes ((tuple2!8192 0))(
  ( (tuple2!8193 (_1!4107 (_ BitVec 64)) (_2!4107 V!17559)) )
))
(declare-datatypes ((List!8263 0))(
  ( (Nil!8260) (Cons!8259 (h!9115 tuple2!8192) (t!14145 List!8263)) )
))
(declare-datatypes ((ListLongMap!7105 0))(
  ( (ListLongMap!7106 (toList!3568 List!8263)) )
))
(declare-fun lt!207610 () ListLongMap!7105)

(declare-fun lt!207611 () ListLongMap!7105)

(assert (=> b!458930 (= lt!207610 lt!207611)))

(declare-fun lt!207608 () ListLongMap!7105)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!17559)

(declare-fun +!1604 (ListLongMap!7105 tuple2!8192) ListLongMap!7105)

(assert (=> b!458930 (= lt!207611 (+!1604 lt!207608 (tuple2!8193 k!794 v!412)))))

(declare-fun lt!207607 () array!28483)

(declare-fun minValue!515 () V!17559)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5827 0))(
  ( (ValueCellFull!5827 (v!8493 V!17559)) (EmptyCell!5827) )
))
(declare-datatypes ((array!28485 0))(
  ( (array!28486 (arr!13683 (Array (_ BitVec 32) ValueCell!5827)) (size!14035 (_ BitVec 32))) )
))
(declare-fun lt!207603 () array!28485)

(declare-fun zeroValue!515 () V!17559)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1750 (array!28483 array!28485 (_ BitVec 32) (_ BitVec 32) V!17559 V!17559 (_ BitVec 32) Int) ListLongMap!7105)

(assert (=> b!458930 (= lt!207610 (getCurrentListMapNoExtraKeys!1750 lt!207607 lt!207603 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28485)

(assert (=> b!458930 (= lt!207608 (getCurrentListMapNoExtraKeys!1750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13328 0))(
  ( (Unit!13329) )
))
(declare-fun lt!207604 () Unit!13328)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!763 (array!28483 array!28485 (_ BitVec 32) (_ BitVec 32) V!17559 V!17559 (_ BitVec 32) (_ BitVec 64) V!17559 (_ BitVec 32) Int) Unit!13328)

(assert (=> b!458930 (= lt!207604 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!763 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458931 () Bool)

(declare-fun res!274204 () Bool)

(declare-fun e!267920 () Bool)

(assert (=> b!458931 (=> (not res!274204) (not e!267920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458931 (= res!274204 (validMask!0 mask!1025))))

(declare-fun b!458932 () Bool)

(declare-fun res!274213 () Bool)

(declare-fun e!267922 () Bool)

(assert (=> b!458932 (=> (not res!274213) (not e!267922))))

(declare-datatypes ((List!8264 0))(
  ( (Nil!8261) (Cons!8260 (h!9116 (_ BitVec 64)) (t!14146 List!8264)) )
))
(declare-fun arrayNoDuplicates!0 (array!28483 (_ BitVec 32) List!8264) Bool)

(assert (=> b!458932 (= res!274213 (arrayNoDuplicates!0 lt!207607 #b00000000000000000000000000000000 Nil!8261))))

(declare-fun b!458933 () Bool)

(assert (=> b!458933 (= e!267922 e!267917)))

(declare-fun res!274209 () Bool)

(assert (=> b!458933 (=> (not res!274209) (not e!267917))))

(assert (=> b!458933 (= res!274209 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207605 () ListLongMap!7105)

(assert (=> b!458933 (= lt!207605 (getCurrentListMapNoExtraKeys!1750 lt!207607 lt!207603 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!458933 (= lt!207603 (array!28486 (store (arr!13683 _values!549) i!563 (ValueCellFull!5827 v!412)) (size!14035 _values!549)))))

(declare-fun lt!207609 () ListLongMap!7105)

(assert (=> b!458933 (= lt!207609 (getCurrentListMapNoExtraKeys!1750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458934 () Bool)

(declare-fun res!274214 () Bool)

(assert (=> b!458934 (=> (not res!274214) (not e!267920))))

(assert (=> b!458934 (= res!274214 (and (= (size!14035 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14034 _keys!709) (size!14035 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!458935 () Bool)

(declare-fun res!274215 () Bool)

(assert (=> b!458935 (=> (not res!274215) (not e!267920))))

(assert (=> b!458935 (= res!274215 (or (= (select (arr!13682 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13682 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458936 () Bool)

(declare-fun res!274202 () Bool)

(assert (=> b!458936 (=> (not res!274202) (not e!267920))))

(assert (=> b!458936 (= res!274202 (validKeyInArray!0 k!794))))

(declare-fun b!458937 () Bool)

(declare-fun e!267921 () Bool)

(assert (=> b!458937 (= e!267921 true)))

(assert (=> b!458937 false))

(declare-fun lt!207606 () Unit!13328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28483 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13328)

(assert (=> b!458937 (= lt!207606 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(declare-fun b!458938 () Bool)

(assert (=> b!458938 (= e!267920 e!267922)))

(declare-fun res!274206 () Bool)

(assert (=> b!458938 (=> (not res!274206) (not e!267922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28483 (_ BitVec 32)) Bool)

(assert (=> b!458938 (= res!274206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207607 mask!1025))))

(assert (=> b!458938 (= lt!207607 (array!28484 (store (arr!13682 _keys!709) i!563 k!794) (size!14034 _keys!709)))))

(declare-fun b!458939 () Bool)

(assert (=> b!458939 (= e!267916 e!267921)))

(declare-fun res!274208 () Bool)

(assert (=> b!458939 (=> res!274208 e!267921)))

(assert (=> b!458939 (= res!274208 (not (= (select (arr!13682 _keys!709) from!863) k!794)))))

(declare-fun get!6745 (ValueCell!5827 V!17559) V!17559)

(declare-fun dynLambda!891 (Int (_ BitVec 64)) V!17559)

(assert (=> b!458939 (= lt!207605 (+!1604 lt!207611 (tuple2!8193 (select (arr!13682 _keys!709) from!863) (get!6745 (select (arr!13683 _values!549) from!863) (dynLambda!891 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!274210 () Bool)

(assert (=> start!41134 (=> (not res!274210) (not e!267920))))

(assert (=> start!41134 (= res!274210 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14034 _keys!709))))))

(assert (=> start!41134 e!267920))

(declare-fun tp_is_empty!12341 () Bool)

(assert (=> start!41134 tp_is_empty!12341))

(assert (=> start!41134 tp!38845))

(assert (=> start!41134 true))

(declare-fun e!267919 () Bool)

(declare-fun array_inv!9902 (array!28485) Bool)

(assert (=> start!41134 (and (array_inv!9902 _values!549) e!267919)))

(declare-fun array_inv!9903 (array!28483) Bool)

(assert (=> start!41134 (array_inv!9903 _keys!709)))

(declare-fun b!458940 () Bool)

(declare-fun res!274205 () Bool)

(assert (=> b!458940 (=> (not res!274205) (not e!267920))))

(declare-fun arrayContainsKey!0 (array!28483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458940 (= res!274205 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20161 () Bool)

(declare-fun mapRes!20161 () Bool)

(assert (=> mapIsEmpty!20161 mapRes!20161))

(declare-fun b!458941 () Bool)

(declare-fun res!274207 () Bool)

(assert (=> b!458941 (=> (not res!274207) (not e!267922))))

(assert (=> b!458941 (= res!274207 (bvsle from!863 i!563))))

(declare-fun b!458942 () Bool)

(declare-fun res!274212 () Bool)

(assert (=> b!458942 (=> (not res!274212) (not e!267920))))

(assert (=> b!458942 (= res!274212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458943 () Bool)

(declare-fun res!274216 () Bool)

(assert (=> b!458943 (=> (not res!274216) (not e!267920))))

(assert (=> b!458943 (= res!274216 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8261))))

(declare-fun b!458944 () Bool)

(declare-fun res!274211 () Bool)

(assert (=> b!458944 (=> (not res!274211) (not e!267920))))

(assert (=> b!458944 (= res!274211 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14034 _keys!709))))))

(declare-fun b!458945 () Bool)

(declare-fun e!267924 () Bool)

(assert (=> b!458945 (= e!267924 tp_is_empty!12341)))

(declare-fun mapNonEmpty!20161 () Bool)

(declare-fun tp!38844 () Bool)

(assert (=> mapNonEmpty!20161 (= mapRes!20161 (and tp!38844 e!267924))))

(declare-fun mapKey!20161 () (_ BitVec 32))

(declare-fun mapValue!20161 () ValueCell!5827)

(declare-fun mapRest!20161 () (Array (_ BitVec 32) ValueCell!5827))

(assert (=> mapNonEmpty!20161 (= (arr!13683 _values!549) (store mapRest!20161 mapKey!20161 mapValue!20161))))

(declare-fun b!458946 () Bool)

(declare-fun e!267923 () Bool)

(assert (=> b!458946 (= e!267923 tp_is_empty!12341)))

(declare-fun b!458947 () Bool)

(assert (=> b!458947 (= e!267919 (and e!267923 mapRes!20161))))

(declare-fun condMapEmpty!20161 () Bool)

(declare-fun mapDefault!20161 () ValueCell!5827)

