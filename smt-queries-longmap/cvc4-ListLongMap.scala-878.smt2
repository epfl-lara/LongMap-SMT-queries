; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20368 () Bool)

(assert start!20368)

(declare-fun b_free!5027 () Bool)

(declare-fun b_next!5027 () Bool)

(assert (=> start!20368 (= b_free!5027 (not b_next!5027))))

(declare-fun tp!18113 () Bool)

(declare-fun b_and!11773 () Bool)

(assert (=> start!20368 (= tp!18113 b_and!11773)))

(declare-fun b!201114 () Bool)

(declare-fun e!131835 () Bool)

(declare-fun tp_is_empty!4883 () Bool)

(assert (=> b!201114 (= e!131835 tp_is_empty!4883)))

(declare-fun b!201115 () Bool)

(declare-fun res!96011 () Bool)

(declare-fun e!131834 () Bool)

(assert (=> b!201115 (=> (not res!96011) (not e!131834))))

(declare-datatypes ((array!8995 0))(
  ( (array!8996 (arr!4248 (Array (_ BitVec 32) (_ BitVec 64))) (size!4573 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8995)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8995 (_ BitVec 32)) Bool)

(assert (=> b!201115 (= res!96011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201116 () Bool)

(declare-fun e!131833 () Bool)

(assert (=> b!201116 (= e!131833 tp_is_empty!4883)))

(declare-fun b!201117 () Bool)

(declare-fun e!131832 () Bool)

(assert (=> b!201117 (= e!131832 true)))

(declare-datatypes ((V!6157 0))(
  ( (V!6158 (val!2486 Int)) )
))
(declare-datatypes ((tuple2!3762 0))(
  ( (tuple2!3763 (_1!1892 (_ BitVec 64)) (_2!1892 V!6157)) )
))
(declare-datatypes ((List!2678 0))(
  ( (Nil!2675) (Cons!2674 (h!3316 tuple2!3762) (t!7609 List!2678)) )
))
(declare-datatypes ((ListLongMap!2675 0))(
  ( (ListLongMap!2676 (toList!1353 List!2678)) )
))
(declare-fun lt!99938 () ListLongMap!2675)

(declare-fun lt!99939 () ListLongMap!2675)

(declare-fun lt!99948 () tuple2!3762)

(declare-fun lt!99949 () tuple2!3762)

(declare-fun +!380 (ListLongMap!2675 tuple2!3762) ListLongMap!2675)

(assert (=> b!201117 (= (+!380 lt!99939 lt!99948) (+!380 lt!99938 lt!99949))))

(declare-fun minValue!615 () V!6157)

(declare-fun lt!99947 () ListLongMap!2675)

(declare-fun v!520 () V!6157)

(declare-fun k!843 () (_ BitVec 64))

(declare-datatypes ((Unit!6060 0))(
  ( (Unit!6061) )
))
(declare-fun lt!99937 () Unit!6060)

(declare-fun addCommutativeForDiffKeys!101 (ListLongMap!2675 (_ BitVec 64) V!6157 (_ BitVec 64) V!6157) Unit!6060)

(assert (=> b!201117 (= lt!99937 (addCommutativeForDiffKeys!101 lt!99947 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201118 () Bool)

(declare-fun res!96012 () Bool)

(assert (=> b!201118 (=> (not res!96012) (not e!131834))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201118 (= res!96012 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4573 _keys!825))))))

(declare-fun b!201119 () Bool)

(declare-fun e!131837 () Bool)

(assert (=> b!201119 (= e!131834 (not e!131837))))

(declare-fun res!96013 () Bool)

(assert (=> b!201119 (=> res!96013 e!131837)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201119 (= res!96013 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2098 0))(
  ( (ValueCellFull!2098 (v!4456 V!6157)) (EmptyCell!2098) )
))
(declare-datatypes ((array!8997 0))(
  ( (array!8998 (arr!4249 (Array (_ BitVec 32) ValueCell!2098)) (size!4574 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8997)

(declare-fun lt!99950 () ListLongMap!2675)

(declare-fun zeroValue!615 () V!6157)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!942 (array!8995 array!8997 (_ BitVec 32) (_ BitVec 32) V!6157 V!6157 (_ BitVec 32) Int) ListLongMap!2675)

(assert (=> b!201119 (= lt!99950 (getCurrentListMap!942 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99943 () array!8997)

(declare-fun lt!99945 () ListLongMap!2675)

(assert (=> b!201119 (= lt!99945 (getCurrentListMap!942 _keys!825 lt!99943 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99940 () ListLongMap!2675)

(declare-fun lt!99951 () ListLongMap!2675)

(assert (=> b!201119 (and (= lt!99940 lt!99951) (= lt!99951 lt!99940))))

(declare-fun lt!99944 () ListLongMap!2675)

(assert (=> b!201119 (= lt!99951 (+!380 lt!99944 lt!99949))))

(assert (=> b!201119 (= lt!99949 (tuple2!3763 k!843 v!520))))

(declare-fun lt!99941 () Unit!6060)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!55 (array!8995 array!8997 (_ BitVec 32) (_ BitVec 32) V!6157 V!6157 (_ BitVec 32) (_ BitVec 64) V!6157 (_ BitVec 32) Int) Unit!6060)

(assert (=> b!201119 (= lt!99941 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!55 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!316 (array!8995 array!8997 (_ BitVec 32) (_ BitVec 32) V!6157 V!6157 (_ BitVec 32) Int) ListLongMap!2675)

(assert (=> b!201119 (= lt!99940 (getCurrentListMapNoExtraKeys!316 _keys!825 lt!99943 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201119 (= lt!99943 (array!8998 (store (arr!4249 _values!649) i!601 (ValueCellFull!2098 v!520)) (size!4574 _values!649)))))

(assert (=> b!201119 (= lt!99944 (getCurrentListMapNoExtraKeys!316 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8393 () Bool)

(declare-fun mapRes!8393 () Bool)

(assert (=> mapIsEmpty!8393 mapRes!8393))

(declare-fun mapNonEmpty!8393 () Bool)

(declare-fun tp!18112 () Bool)

(assert (=> mapNonEmpty!8393 (= mapRes!8393 (and tp!18112 e!131835))))

(declare-fun mapValue!8393 () ValueCell!2098)

(declare-fun mapRest!8393 () (Array (_ BitVec 32) ValueCell!2098))

(declare-fun mapKey!8393 () (_ BitVec 32))

(assert (=> mapNonEmpty!8393 (= (arr!4249 _values!649) (store mapRest!8393 mapKey!8393 mapValue!8393))))

(declare-fun b!201120 () Bool)

(declare-fun res!96010 () Bool)

(assert (=> b!201120 (=> (not res!96010) (not e!131834))))

(declare-datatypes ((List!2679 0))(
  ( (Nil!2676) (Cons!2675 (h!3317 (_ BitVec 64)) (t!7610 List!2679)) )
))
(declare-fun arrayNoDuplicates!0 (array!8995 (_ BitVec 32) List!2679) Bool)

(assert (=> b!201120 (= res!96010 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2676))))

(declare-fun res!96014 () Bool)

(assert (=> start!20368 (=> (not res!96014) (not e!131834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20368 (= res!96014 (validMask!0 mask!1149))))

(assert (=> start!20368 e!131834))

(declare-fun e!131836 () Bool)

(declare-fun array_inv!2797 (array!8997) Bool)

(assert (=> start!20368 (and (array_inv!2797 _values!649) e!131836)))

(assert (=> start!20368 true))

(assert (=> start!20368 tp_is_empty!4883))

(declare-fun array_inv!2798 (array!8995) Bool)

(assert (=> start!20368 (array_inv!2798 _keys!825)))

(assert (=> start!20368 tp!18113))

(declare-fun b!201121 () Bool)

(declare-fun res!96015 () Bool)

(assert (=> b!201121 (=> (not res!96015) (not e!131834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201121 (= res!96015 (validKeyInArray!0 k!843))))

(declare-fun b!201122 () Bool)

(assert (=> b!201122 (= e!131837 e!131832)))

(declare-fun res!96008 () Bool)

(assert (=> b!201122 (=> res!96008 e!131832)))

(assert (=> b!201122 (= res!96008 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99946 () ListLongMap!2675)

(assert (=> b!201122 (= lt!99946 lt!99939)))

(assert (=> b!201122 (= lt!99939 (+!380 lt!99947 lt!99949))))

(declare-fun lt!99936 () Unit!6060)

(assert (=> b!201122 (= lt!99936 (addCommutativeForDiffKeys!101 lt!99944 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!201122 (= lt!99945 (+!380 lt!99946 lt!99948))))

(declare-fun lt!99942 () tuple2!3762)

(assert (=> b!201122 (= lt!99946 (+!380 lt!99951 lt!99942))))

(assert (=> b!201122 (= lt!99950 lt!99938)))

(assert (=> b!201122 (= lt!99938 (+!380 lt!99947 lt!99948))))

(assert (=> b!201122 (= lt!99947 (+!380 lt!99944 lt!99942))))

(assert (=> b!201122 (= lt!99945 (+!380 (+!380 lt!99940 lt!99942) lt!99948))))

(assert (=> b!201122 (= lt!99948 (tuple2!3763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201122 (= lt!99942 (tuple2!3763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201123 () Bool)

(assert (=> b!201123 (= e!131836 (and e!131833 mapRes!8393))))

(declare-fun condMapEmpty!8393 () Bool)

(declare-fun mapDefault!8393 () ValueCell!2098)

