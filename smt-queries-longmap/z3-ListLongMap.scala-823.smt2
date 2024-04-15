; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20038 () Bool)

(assert start!20038)

(declare-fun mapIsEmpty!7892 () Bool)

(declare-fun mapRes!7892 () Bool)

(assert (=> mapIsEmpty!7892 mapRes!7892))

(declare-fun b!196050 () Bool)

(declare-fun e!129076 () Bool)

(declare-fun e!129075 () Bool)

(assert (=> b!196050 (= e!129076 (and e!129075 mapRes!7892))))

(declare-fun condMapEmpty!7892 () Bool)

(declare-datatypes ((V!5713 0))(
  ( (V!5714 (val!2319 Int)) )
))
(declare-datatypes ((ValueCell!1931 0))(
  ( (ValueCellFull!1931 (v!4283 V!5713)) (EmptyCell!1931) )
))
(declare-datatypes ((array!8339 0))(
  ( (array!8340 (arr!3919 (Array (_ BitVec 32) ValueCell!1931)) (size!4245 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8339)

(declare-fun mapDefault!7892 () ValueCell!1931)

(assert (=> b!196050 (= condMapEmpty!7892 (= (arr!3919 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1931)) mapDefault!7892)))))

(declare-fun b!196051 () Bool)

(declare-fun res!92501 () Bool)

(declare-fun e!129078 () Bool)

(assert (=> b!196051 (=> (not res!92501) (not e!129078))))

(declare-datatypes ((array!8341 0))(
  ( (array!8342 (arr!3920 (Array (_ BitVec 32) (_ BitVec 64))) (size!4246 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8341)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8341 (_ BitVec 32)) Bool)

(assert (=> b!196051 (= res!92501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!7892 () Bool)

(declare-fun tp!17180 () Bool)

(declare-fun e!129074 () Bool)

(assert (=> mapNonEmpty!7892 (= mapRes!7892 (and tp!17180 e!129074))))

(declare-fun mapRest!7892 () (Array (_ BitVec 32) ValueCell!1931))

(declare-fun mapKey!7892 () (_ BitVec 32))

(declare-fun mapValue!7892 () ValueCell!1931)

(assert (=> mapNonEmpty!7892 (= (arr!3919 _values!649) (store mapRest!7892 mapKey!7892 mapValue!7892))))

(declare-fun b!196052 () Bool)

(declare-fun tp_is_empty!4549 () Bool)

(assert (=> b!196052 (= e!129074 tp_is_empty!4549)))

(declare-fun b!196053 () Bool)

(assert (=> b!196053 (= e!129078 false)))

(declare-fun lt!97397 () Bool)

(declare-datatypes ((List!2441 0))(
  ( (Nil!2438) (Cons!2437 (h!3079 (_ BitVec 64)) (t!7363 List!2441)) )
))
(declare-fun arrayNoDuplicates!0 (array!8341 (_ BitVec 32) List!2441) Bool)

(assert (=> b!196053 (= lt!97397 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2438))))

(declare-fun res!92500 () Bool)

(assert (=> start!20038 (=> (not res!92500) (not e!129078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20038 (= res!92500 (validMask!0 mask!1149))))

(assert (=> start!20038 e!129078))

(assert (=> start!20038 true))

(declare-fun array_inv!2539 (array!8339) Bool)

(assert (=> start!20038 (and (array_inv!2539 _values!649) e!129076)))

(declare-fun array_inv!2540 (array!8341) Bool)

(assert (=> start!20038 (array_inv!2540 _keys!825)))

(declare-fun b!196054 () Bool)

(declare-fun res!92499 () Bool)

(assert (=> b!196054 (=> (not res!92499) (not e!129078))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196054 (= res!92499 (and (= (size!4245 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4246 _keys!825) (size!4245 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196055 () Bool)

(assert (=> b!196055 (= e!129075 tp_is_empty!4549)))

(assert (= (and start!20038 res!92500) b!196054))

(assert (= (and b!196054 res!92499) b!196051))

(assert (= (and b!196051 res!92501) b!196053))

(assert (= (and b!196050 condMapEmpty!7892) mapIsEmpty!7892))

(assert (= (and b!196050 (not condMapEmpty!7892)) mapNonEmpty!7892))

(get-info :version)

(assert (= (and mapNonEmpty!7892 ((_ is ValueCellFull!1931) mapValue!7892)) b!196052))

(assert (= (and b!196050 ((_ is ValueCellFull!1931) mapDefault!7892)) b!196055))

(assert (= start!20038 b!196050))

(declare-fun m!222939 () Bool)

(assert (=> b!196051 m!222939))

(declare-fun m!222941 () Bool)

(assert (=> mapNonEmpty!7892 m!222941))

(declare-fun m!222943 () Bool)

(assert (=> b!196053 m!222943))

(declare-fun m!222945 () Bool)

(assert (=> start!20038 m!222945))

(declare-fun m!222947 () Bool)

(assert (=> start!20038 m!222947))

(declare-fun m!222949 () Bool)

(assert (=> start!20038 m!222949))

(check-sat (not b!196053) (not b!196051) (not start!20038) tp_is_empty!4549 (not mapNonEmpty!7892))
(check-sat)
