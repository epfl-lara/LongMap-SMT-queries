; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40390 () Bool)

(assert start!40390)

(declare-fun b!443951 () Bool)

(declare-fun e!261151 () Bool)

(declare-fun e!261150 () Bool)

(assert (=> b!443951 (= e!261151 e!261150)))

(declare-fun res!263166 () Bool)

(assert (=> b!443951 (=> (not res!263166) (not e!261150))))

(declare-datatypes ((array!27359 0))(
  ( (array!27360 (arr!13127 (Array (_ BitVec 32) (_ BitVec 64))) (size!13479 (_ BitVec 32))) )
))
(declare-fun lt!203417 () array!27359)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27359 (_ BitVec 32)) Bool)

(assert (=> b!443951 (= res!263166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203417 mask!1025))))

(declare-fun _keys!709 () array!27359)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!443951 (= lt!203417 (array!27360 (store (arr!13127 _keys!709) i!563 k0!794) (size!13479 _keys!709)))))

(declare-fun b!443952 () Bool)

(declare-fun res!263161 () Bool)

(assert (=> b!443952 (=> (not res!263161) (not e!261151))))

(assert (=> b!443952 (= res!263161 (or (= (select (arr!13127 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13127 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443953 () Bool)

(assert (=> b!443953 (= e!261150 false)))

(declare-fun lt!203416 () Bool)

(declare-datatypes ((List!7864 0))(
  ( (Nil!7861) (Cons!7860 (h!8716 (_ BitVec 64)) (t!13622 List!7864)) )
))
(declare-fun arrayNoDuplicates!0 (array!27359 (_ BitVec 32) List!7864) Bool)

(assert (=> b!443953 (= lt!203416 (arrayNoDuplicates!0 lt!203417 #b00000000000000000000000000000000 Nil!7861))))

(declare-fun mapNonEmpty!19290 () Bool)

(declare-fun mapRes!19290 () Bool)

(declare-fun tp!37272 () Bool)

(declare-fun e!261152 () Bool)

(assert (=> mapNonEmpty!19290 (= mapRes!19290 (and tp!37272 e!261152))))

(declare-fun mapKey!19290 () (_ BitVec 32))

(declare-datatypes ((V!16805 0))(
  ( (V!16806 (val!5932 Int)) )
))
(declare-datatypes ((ValueCell!5544 0))(
  ( (ValueCellFull!5544 (v!8183 V!16805)) (EmptyCell!5544) )
))
(declare-datatypes ((array!27361 0))(
  ( (array!27362 (arr!13128 (Array (_ BitVec 32) ValueCell!5544)) (size!13480 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27361)

(declare-fun mapRest!19290 () (Array (_ BitVec 32) ValueCell!5544))

(declare-fun mapValue!19290 () ValueCell!5544)

(assert (=> mapNonEmpty!19290 (= (arr!13128 _values!549) (store mapRest!19290 mapKey!19290 mapValue!19290))))

(declare-fun mapIsEmpty!19290 () Bool)

(assert (=> mapIsEmpty!19290 mapRes!19290))

(declare-fun b!443954 () Bool)

(declare-fun res!263169 () Bool)

(assert (=> b!443954 (=> (not res!263169) (not e!261151))))

(declare-fun arrayContainsKey!0 (array!27359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443954 (= res!263169 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443955 () Bool)

(declare-fun res!263163 () Bool)

(assert (=> b!443955 (=> (not res!263163) (not e!261151))))

(assert (=> b!443955 (= res!263163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443956 () Bool)

(declare-fun res!263167 () Bool)

(assert (=> b!443956 (=> (not res!263167) (not e!261151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443956 (= res!263167 (validMask!0 mask!1025))))

(declare-fun b!443957 () Bool)

(declare-fun res!263162 () Bool)

(assert (=> b!443957 (=> (not res!263162) (not e!261151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443957 (= res!263162 (validKeyInArray!0 k0!794))))

(declare-fun b!443958 () Bool)

(declare-fun res!263168 () Bool)

(assert (=> b!443958 (=> (not res!263168) (not e!261151))))

(assert (=> b!443958 (= res!263168 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13479 _keys!709))))))

(declare-fun b!443959 () Bool)

(declare-fun e!261147 () Bool)

(declare-fun tp_is_empty!11775 () Bool)

(assert (=> b!443959 (= e!261147 tp_is_empty!11775)))

(declare-fun res!263170 () Bool)

(assert (=> start!40390 (=> (not res!263170) (not e!261151))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40390 (= res!263170 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13479 _keys!709))))))

(assert (=> start!40390 e!261151))

(assert (=> start!40390 true))

(declare-fun e!261148 () Bool)

(declare-fun array_inv!9526 (array!27361) Bool)

(assert (=> start!40390 (and (array_inv!9526 _values!549) e!261148)))

(declare-fun array_inv!9527 (array!27359) Bool)

(assert (=> start!40390 (array_inv!9527 _keys!709)))

(declare-fun b!443960 () Bool)

(declare-fun res!263164 () Bool)

(assert (=> b!443960 (=> (not res!263164) (not e!261151))))

(assert (=> b!443960 (= res!263164 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7861))))

(declare-fun b!443961 () Bool)

(assert (=> b!443961 (= e!261148 (and e!261147 mapRes!19290))))

(declare-fun condMapEmpty!19290 () Bool)

(declare-fun mapDefault!19290 () ValueCell!5544)

(assert (=> b!443961 (= condMapEmpty!19290 (= (arr!13128 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5544)) mapDefault!19290)))))

(declare-fun b!443962 () Bool)

(assert (=> b!443962 (= e!261152 tp_is_empty!11775)))

(declare-fun b!443963 () Bool)

(declare-fun res!263165 () Bool)

(assert (=> b!443963 (=> (not res!263165) (not e!261151))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443963 (= res!263165 (and (= (size!13480 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13479 _keys!709) (size!13480 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40390 res!263170) b!443956))

(assert (= (and b!443956 res!263167) b!443963))

(assert (= (and b!443963 res!263165) b!443955))

(assert (= (and b!443955 res!263163) b!443960))

(assert (= (and b!443960 res!263164) b!443958))

(assert (= (and b!443958 res!263168) b!443957))

(assert (= (and b!443957 res!263162) b!443952))

(assert (= (and b!443952 res!263161) b!443954))

(assert (= (and b!443954 res!263169) b!443951))

(assert (= (and b!443951 res!263166) b!443953))

(assert (= (and b!443961 condMapEmpty!19290) mapIsEmpty!19290))

(assert (= (and b!443961 (not condMapEmpty!19290)) mapNonEmpty!19290))

(get-info :version)

(assert (= (and mapNonEmpty!19290 ((_ is ValueCellFull!5544) mapValue!19290)) b!443962))

(assert (= (and b!443961 ((_ is ValueCellFull!5544) mapDefault!19290)) b!443959))

(assert (= start!40390 b!443961))

(declare-fun m!430021 () Bool)

(assert (=> b!443960 m!430021))

(declare-fun m!430023 () Bool)

(assert (=> b!443953 m!430023))

(declare-fun m!430025 () Bool)

(assert (=> b!443956 m!430025))

(declare-fun m!430027 () Bool)

(assert (=> b!443951 m!430027))

(declare-fun m!430029 () Bool)

(assert (=> b!443951 m!430029))

(declare-fun m!430031 () Bool)

(assert (=> mapNonEmpty!19290 m!430031))

(declare-fun m!430033 () Bool)

(assert (=> b!443955 m!430033))

(declare-fun m!430035 () Bool)

(assert (=> b!443954 m!430035))

(declare-fun m!430037 () Bool)

(assert (=> start!40390 m!430037))

(declare-fun m!430039 () Bool)

(assert (=> start!40390 m!430039))

(declare-fun m!430041 () Bool)

(assert (=> b!443957 m!430041))

(declare-fun m!430043 () Bool)

(assert (=> b!443952 m!430043))

(check-sat (not b!443960) tp_is_empty!11775 (not b!443954) (not b!443951) (not b!443955) (not b!443953) (not start!40390) (not b!443957) (not b!443956) (not mapNonEmpty!19290))
(check-sat)
