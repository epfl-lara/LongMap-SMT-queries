; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40344 () Bool)

(assert start!40344)

(declare-fun b!443056 () Bool)

(declare-fun res!262559 () Bool)

(declare-fun e!260685 () Bool)

(assert (=> b!443056 (=> (not res!262559) (not e!260685))))

(declare-datatypes ((array!27299 0))(
  ( (array!27300 (arr!13097 (Array (_ BitVec 32) (_ BitVec 64))) (size!13450 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27299)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443056 (= res!262559 (or (= (select (arr!13097 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13097 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443057 () Bool)

(declare-fun res!262552 () Bool)

(assert (=> b!443057 (=> (not res!262552) (not e!260685))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443057 (= res!262552 (validMask!0 mask!1025))))

(declare-fun b!443058 () Bool)

(declare-fun res!262556 () Bool)

(assert (=> b!443058 (=> (not res!262556) (not e!260685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27299 (_ BitVec 32)) Bool)

(assert (=> b!443058 (= res!262556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!262561 () Bool)

(assert (=> start!40344 (=> (not res!262561) (not e!260685))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40344 (= res!262561 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13450 _keys!709))))))

(assert (=> start!40344 e!260685))

(assert (=> start!40344 true))

(declare-datatypes ((V!16763 0))(
  ( (V!16764 (val!5916 Int)) )
))
(declare-datatypes ((ValueCell!5528 0))(
  ( (ValueCellFull!5528 (v!8161 V!16763)) (EmptyCell!5528) )
))
(declare-datatypes ((array!27301 0))(
  ( (array!27302 (arr!13098 (Array (_ BitVec 32) ValueCell!5528)) (size!13451 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27301)

(declare-fun e!260687 () Bool)

(declare-fun array_inv!9552 (array!27301) Bool)

(assert (=> start!40344 (and (array_inv!9552 _values!549) e!260687)))

(declare-fun array_inv!9553 (array!27299) Bool)

(assert (=> start!40344 (array_inv!9553 _keys!709)))

(declare-fun b!443059 () Bool)

(declare-fun e!260689 () Bool)

(declare-fun mapRes!19242 () Bool)

(assert (=> b!443059 (= e!260687 (and e!260689 mapRes!19242))))

(declare-fun condMapEmpty!19242 () Bool)

(declare-fun mapDefault!19242 () ValueCell!5528)

(assert (=> b!443059 (= condMapEmpty!19242 (= (arr!13098 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5528)) mapDefault!19242)))))

(declare-fun b!443060 () Bool)

(declare-fun res!262557 () Bool)

(assert (=> b!443060 (=> (not res!262557) (not e!260685))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443060 (= res!262557 (and (= (size!13451 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13450 _keys!709) (size!13451 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443061 () Bool)

(declare-fun res!262558 () Bool)

(assert (=> b!443061 (=> (not res!262558) (not e!260685))))

(declare-datatypes ((List!7855 0))(
  ( (Nil!7852) (Cons!7851 (h!8707 (_ BitVec 64)) (t!13604 List!7855)) )
))
(declare-fun arrayNoDuplicates!0 (array!27299 (_ BitVec 32) List!7855) Bool)

(assert (=> b!443061 (= res!262558 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7852))))

(declare-fun b!443062 () Bool)

(declare-fun tp_is_empty!11743 () Bool)

(assert (=> b!443062 (= e!260689 tp_is_empty!11743)))

(declare-fun b!443063 () Bool)

(declare-fun res!262553 () Bool)

(assert (=> b!443063 (=> (not res!262553) (not e!260685))))

(assert (=> b!443063 (= res!262553 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13450 _keys!709))))))

(declare-fun b!443064 () Bool)

(declare-fun e!260686 () Bool)

(assert (=> b!443064 (= e!260686 false)))

(declare-fun lt!203087 () Bool)

(declare-fun lt!203086 () array!27299)

(assert (=> b!443064 (= lt!203087 (arrayNoDuplicates!0 lt!203086 #b00000000000000000000000000000000 Nil!7852))))

(declare-fun mapNonEmpty!19242 () Bool)

(declare-fun tp!37224 () Bool)

(declare-fun e!260688 () Bool)

(assert (=> mapNonEmpty!19242 (= mapRes!19242 (and tp!37224 e!260688))))

(declare-fun mapRest!19242 () (Array (_ BitVec 32) ValueCell!5528))

(declare-fun mapKey!19242 () (_ BitVec 32))

(declare-fun mapValue!19242 () ValueCell!5528)

(assert (=> mapNonEmpty!19242 (= (arr!13098 _values!549) (store mapRest!19242 mapKey!19242 mapValue!19242))))

(declare-fun mapIsEmpty!19242 () Bool)

(assert (=> mapIsEmpty!19242 mapRes!19242))

(declare-fun b!443065 () Bool)

(declare-fun res!262555 () Bool)

(assert (=> b!443065 (=> (not res!262555) (not e!260685))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443065 (= res!262555 (validKeyInArray!0 k0!794))))

(declare-fun b!443066 () Bool)

(declare-fun res!262560 () Bool)

(assert (=> b!443066 (=> (not res!262560) (not e!260685))))

(declare-fun arrayContainsKey!0 (array!27299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443066 (= res!262560 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443067 () Bool)

(assert (=> b!443067 (= e!260685 e!260686)))

(declare-fun res!262554 () Bool)

(assert (=> b!443067 (=> (not res!262554) (not e!260686))))

(assert (=> b!443067 (= res!262554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203086 mask!1025))))

(assert (=> b!443067 (= lt!203086 (array!27300 (store (arr!13097 _keys!709) i!563 k0!794) (size!13450 _keys!709)))))

(declare-fun b!443068 () Bool)

(assert (=> b!443068 (= e!260688 tp_is_empty!11743)))

(assert (= (and start!40344 res!262561) b!443057))

(assert (= (and b!443057 res!262552) b!443060))

(assert (= (and b!443060 res!262557) b!443058))

(assert (= (and b!443058 res!262556) b!443061))

(assert (= (and b!443061 res!262558) b!443063))

(assert (= (and b!443063 res!262553) b!443065))

(assert (= (and b!443065 res!262555) b!443056))

(assert (= (and b!443056 res!262559) b!443066))

(assert (= (and b!443066 res!262560) b!443067))

(assert (= (and b!443067 res!262554) b!443064))

(assert (= (and b!443059 condMapEmpty!19242) mapIsEmpty!19242))

(assert (= (and b!443059 (not condMapEmpty!19242)) mapNonEmpty!19242))

(get-info :version)

(assert (= (and mapNonEmpty!19242 ((_ is ValueCellFull!5528) mapValue!19242)) b!443068))

(assert (= (and b!443059 ((_ is ValueCellFull!5528) mapDefault!19242)) b!443062))

(assert (= start!40344 b!443059))

(declare-fun m!428905 () Bool)

(assert (=> b!443066 m!428905))

(declare-fun m!428907 () Bool)

(assert (=> b!443067 m!428907))

(declare-fun m!428909 () Bool)

(assert (=> b!443067 m!428909))

(declare-fun m!428911 () Bool)

(assert (=> b!443058 m!428911))

(declare-fun m!428913 () Bool)

(assert (=> b!443065 m!428913))

(declare-fun m!428915 () Bool)

(assert (=> start!40344 m!428915))

(declare-fun m!428917 () Bool)

(assert (=> start!40344 m!428917))

(declare-fun m!428919 () Bool)

(assert (=> b!443064 m!428919))

(declare-fun m!428921 () Bool)

(assert (=> mapNonEmpty!19242 m!428921))

(declare-fun m!428923 () Bool)

(assert (=> b!443057 m!428923))

(declare-fun m!428925 () Bool)

(assert (=> b!443061 m!428925))

(declare-fun m!428927 () Bool)

(assert (=> b!443056 m!428927))

(check-sat (not start!40344) (not b!443057) (not b!443066) (not b!443067) (not b!443061) (not b!443058) tp_is_empty!11743 (not b!443064) (not mapNonEmpty!19242) (not b!443065))
(check-sat)
