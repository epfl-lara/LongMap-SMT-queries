; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40384 () Bool)

(assert start!40384)

(declare-fun b!443834 () Bool)

(declare-fun res!263079 () Bool)

(declare-fun e!261097 () Bool)

(assert (=> b!443834 (=> (not res!263079) (not e!261097))))

(declare-datatypes ((array!27347 0))(
  ( (array!27348 (arr!13121 (Array (_ BitVec 32) (_ BitVec 64))) (size!13473 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27347)

(declare-datatypes ((List!7862 0))(
  ( (Nil!7859) (Cons!7858 (h!8714 (_ BitVec 64)) (t!13620 List!7862)) )
))
(declare-fun arrayNoDuplicates!0 (array!27347 (_ BitVec 32) List!7862) Bool)

(assert (=> b!443834 (= res!263079 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7859))))

(declare-fun b!443835 () Bool)

(declare-fun res!263073 () Bool)

(assert (=> b!443835 (=> (not res!263073) (not e!261097))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16797 0))(
  ( (V!16798 (val!5929 Int)) )
))
(declare-datatypes ((ValueCell!5541 0))(
  ( (ValueCellFull!5541 (v!8180 V!16797)) (EmptyCell!5541) )
))
(declare-datatypes ((array!27349 0))(
  ( (array!27350 (arr!13122 (Array (_ BitVec 32) ValueCell!5541)) (size!13474 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27349)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!443835 (= res!263073 (and (= (size!13474 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13473 _keys!709) (size!13474 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!263080 () Bool)

(assert (=> start!40384 (=> (not res!263080) (not e!261097))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40384 (= res!263080 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13473 _keys!709))))))

(assert (=> start!40384 e!261097))

(assert (=> start!40384 true))

(declare-fun e!261098 () Bool)

(declare-fun array_inv!9520 (array!27349) Bool)

(assert (=> start!40384 (and (array_inv!9520 _values!549) e!261098)))

(declare-fun array_inv!9521 (array!27347) Bool)

(assert (=> start!40384 (array_inv!9521 _keys!709)))

(declare-fun b!443836 () Bool)

(declare-fun res!263078 () Bool)

(assert (=> b!443836 (=> (not res!263078) (not e!261097))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443836 (= res!263078 (validKeyInArray!0 k0!794))))

(declare-fun b!443837 () Bool)

(declare-fun res!263075 () Bool)

(assert (=> b!443837 (=> (not res!263075) (not e!261097))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443837 (= res!263075 (or (= (select (arr!13121 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13121 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19281 () Bool)

(declare-fun mapRes!19281 () Bool)

(declare-fun tp!37263 () Bool)

(declare-fun e!261093 () Bool)

(assert (=> mapNonEmpty!19281 (= mapRes!19281 (and tp!37263 e!261093))))

(declare-fun mapValue!19281 () ValueCell!5541)

(declare-fun mapKey!19281 () (_ BitVec 32))

(declare-fun mapRest!19281 () (Array (_ BitVec 32) ValueCell!5541))

(assert (=> mapNonEmpty!19281 (= (arr!13122 _values!549) (store mapRest!19281 mapKey!19281 mapValue!19281))))

(declare-fun b!443838 () Bool)

(declare-fun res!263077 () Bool)

(assert (=> b!443838 (=> (not res!263077) (not e!261097))))

(declare-fun arrayContainsKey!0 (array!27347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443838 (= res!263077 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443839 () Bool)

(declare-fun res!263074 () Bool)

(assert (=> b!443839 (=> (not res!263074) (not e!261097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27347 (_ BitVec 32)) Bool)

(assert (=> b!443839 (= res!263074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443840 () Bool)

(declare-fun e!261096 () Bool)

(assert (=> b!443840 (= e!261096 false)))

(declare-fun lt!203399 () Bool)

(declare-fun lt!203398 () array!27347)

(assert (=> b!443840 (= lt!203399 (arrayNoDuplicates!0 lt!203398 #b00000000000000000000000000000000 Nil!7859))))

(declare-fun b!443841 () Bool)

(declare-fun e!261095 () Bool)

(assert (=> b!443841 (= e!261098 (and e!261095 mapRes!19281))))

(declare-fun condMapEmpty!19281 () Bool)

(declare-fun mapDefault!19281 () ValueCell!5541)

(assert (=> b!443841 (= condMapEmpty!19281 (= (arr!13122 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5541)) mapDefault!19281)))))

(declare-fun b!443842 () Bool)

(declare-fun tp_is_empty!11769 () Bool)

(assert (=> b!443842 (= e!261095 tp_is_empty!11769)))

(declare-fun b!443843 () Bool)

(assert (=> b!443843 (= e!261097 e!261096)))

(declare-fun res!263072 () Bool)

(assert (=> b!443843 (=> (not res!263072) (not e!261096))))

(assert (=> b!443843 (= res!263072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203398 mask!1025))))

(assert (=> b!443843 (= lt!203398 (array!27348 (store (arr!13121 _keys!709) i!563 k0!794) (size!13473 _keys!709)))))

(declare-fun mapIsEmpty!19281 () Bool)

(assert (=> mapIsEmpty!19281 mapRes!19281))

(declare-fun b!443844 () Bool)

(declare-fun res!263076 () Bool)

(assert (=> b!443844 (=> (not res!263076) (not e!261097))))

(assert (=> b!443844 (= res!263076 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13473 _keys!709))))))

(declare-fun b!443845 () Bool)

(assert (=> b!443845 (= e!261093 tp_is_empty!11769)))

(declare-fun b!443846 () Bool)

(declare-fun res!263071 () Bool)

(assert (=> b!443846 (=> (not res!263071) (not e!261097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443846 (= res!263071 (validMask!0 mask!1025))))

(assert (= (and start!40384 res!263080) b!443846))

(assert (= (and b!443846 res!263071) b!443835))

(assert (= (and b!443835 res!263073) b!443839))

(assert (= (and b!443839 res!263074) b!443834))

(assert (= (and b!443834 res!263079) b!443844))

(assert (= (and b!443844 res!263076) b!443836))

(assert (= (and b!443836 res!263078) b!443837))

(assert (= (and b!443837 res!263075) b!443838))

(assert (= (and b!443838 res!263077) b!443843))

(assert (= (and b!443843 res!263072) b!443840))

(assert (= (and b!443841 condMapEmpty!19281) mapIsEmpty!19281))

(assert (= (and b!443841 (not condMapEmpty!19281)) mapNonEmpty!19281))

(get-info :version)

(assert (= (and mapNonEmpty!19281 ((_ is ValueCellFull!5541) mapValue!19281)) b!443845))

(assert (= (and b!443841 ((_ is ValueCellFull!5541) mapDefault!19281)) b!443842))

(assert (= start!40384 b!443841))

(declare-fun m!429949 () Bool)

(assert (=> start!40384 m!429949))

(declare-fun m!429951 () Bool)

(assert (=> start!40384 m!429951))

(declare-fun m!429953 () Bool)

(assert (=> b!443846 m!429953))

(declare-fun m!429955 () Bool)

(assert (=> b!443837 m!429955))

(declare-fun m!429957 () Bool)

(assert (=> b!443843 m!429957))

(declare-fun m!429959 () Bool)

(assert (=> b!443843 m!429959))

(declare-fun m!429961 () Bool)

(assert (=> b!443838 m!429961))

(declare-fun m!429963 () Bool)

(assert (=> b!443840 m!429963))

(declare-fun m!429965 () Bool)

(assert (=> b!443836 m!429965))

(declare-fun m!429967 () Bool)

(assert (=> b!443839 m!429967))

(declare-fun m!429969 () Bool)

(assert (=> b!443834 m!429969))

(declare-fun m!429971 () Bool)

(assert (=> mapNonEmpty!19281 m!429971))

(check-sat (not b!443843) (not b!443840) (not start!40384) (not b!443834) tp_is_empty!11769 (not b!443836) (not b!443839) (not b!443846) (not b!443838) (not mapNonEmpty!19281))
(check-sat)
