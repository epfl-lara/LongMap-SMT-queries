; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40372 () Bool)

(assert start!40372)

(declare-fun b!443600 () Bool)

(declare-fun res!262894 () Bool)

(declare-fun e!260989 () Bool)

(assert (=> b!443600 (=> (not res!262894) (not e!260989))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443600 (= res!262894 (validKeyInArray!0 k0!794))))

(declare-fun b!443601 () Bool)

(declare-fun res!262899 () Bool)

(assert (=> b!443601 (=> (not res!262899) (not e!260989))))

(declare-datatypes ((array!27327 0))(
  ( (array!27328 (arr!13111 (Array (_ BitVec 32) (_ BitVec 64))) (size!13463 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27327)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16781 0))(
  ( (V!16782 (val!5923 Int)) )
))
(declare-datatypes ((ValueCell!5535 0))(
  ( (ValueCellFull!5535 (v!8174 V!16781)) (EmptyCell!5535) )
))
(declare-datatypes ((array!27329 0))(
  ( (array!27330 (arr!13112 (Array (_ BitVec 32) ValueCell!5535)) (size!13464 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27329)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!443601 (= res!262899 (and (= (size!13464 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13463 _keys!709) (size!13464 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443602 () Bool)

(declare-fun res!262892 () Bool)

(assert (=> b!443602 (=> (not res!262892) (not e!260989))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443602 (= res!262892 (or (= (select (arr!13111 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13111 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443603 () Bool)

(declare-fun res!262898 () Bool)

(assert (=> b!443603 (=> (not res!262898) (not e!260989))))

(declare-fun arrayContainsKey!0 (array!27327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443603 (= res!262898 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!262900 () Bool)

(assert (=> start!40372 (=> (not res!262900) (not e!260989))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40372 (= res!262900 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13463 _keys!709))))))

(assert (=> start!40372 e!260989))

(assert (=> start!40372 true))

(declare-fun e!260987 () Bool)

(declare-fun array_inv!9512 (array!27329) Bool)

(assert (=> start!40372 (and (array_inv!9512 _values!549) e!260987)))

(declare-fun array_inv!9513 (array!27327) Bool)

(assert (=> start!40372 (array_inv!9513 _keys!709)))

(declare-fun mapNonEmpty!19263 () Bool)

(declare-fun mapRes!19263 () Bool)

(declare-fun tp!37245 () Bool)

(declare-fun e!260986 () Bool)

(assert (=> mapNonEmpty!19263 (= mapRes!19263 (and tp!37245 e!260986))))

(declare-fun mapValue!19263 () ValueCell!5535)

(declare-fun mapRest!19263 () (Array (_ BitVec 32) ValueCell!5535))

(declare-fun mapKey!19263 () (_ BitVec 32))

(assert (=> mapNonEmpty!19263 (= (arr!13112 _values!549) (store mapRest!19263 mapKey!19263 mapValue!19263))))

(declare-fun b!443604 () Bool)

(declare-fun e!260988 () Bool)

(assert (=> b!443604 (= e!260987 (and e!260988 mapRes!19263))))

(declare-fun condMapEmpty!19263 () Bool)

(declare-fun mapDefault!19263 () ValueCell!5535)

(assert (=> b!443604 (= condMapEmpty!19263 (= (arr!13112 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5535)) mapDefault!19263)))))

(declare-fun b!443605 () Bool)

(declare-fun res!262895 () Bool)

(assert (=> b!443605 (=> (not res!262895) (not e!260989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443605 (= res!262895 (validMask!0 mask!1025))))

(declare-fun b!443606 () Bool)

(declare-fun res!262893 () Bool)

(assert (=> b!443606 (=> (not res!262893) (not e!260989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27327 (_ BitVec 32)) Bool)

(assert (=> b!443606 (= res!262893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443607 () Bool)

(declare-fun res!262897 () Bool)

(assert (=> b!443607 (=> (not res!262897) (not e!260989))))

(assert (=> b!443607 (= res!262897 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13463 _keys!709))))))

(declare-fun b!443608 () Bool)

(declare-fun tp_is_empty!11757 () Bool)

(assert (=> b!443608 (= e!260988 tp_is_empty!11757)))

(declare-fun b!443609 () Bool)

(assert (=> b!443609 (= e!260986 tp_is_empty!11757)))

(declare-fun b!443610 () Bool)

(declare-fun e!260985 () Bool)

(assert (=> b!443610 (= e!260989 e!260985)))

(declare-fun res!262891 () Bool)

(assert (=> b!443610 (=> (not res!262891) (not e!260985))))

(declare-fun lt!203363 () array!27327)

(assert (=> b!443610 (= res!262891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203363 mask!1025))))

(assert (=> b!443610 (= lt!203363 (array!27328 (store (arr!13111 _keys!709) i!563 k0!794) (size!13463 _keys!709)))))

(declare-fun mapIsEmpty!19263 () Bool)

(assert (=> mapIsEmpty!19263 mapRes!19263))

(declare-fun b!443611 () Bool)

(declare-fun res!262896 () Bool)

(assert (=> b!443611 (=> (not res!262896) (not e!260989))))

(declare-datatypes ((List!7859 0))(
  ( (Nil!7856) (Cons!7855 (h!8711 (_ BitVec 64)) (t!13617 List!7859)) )
))
(declare-fun arrayNoDuplicates!0 (array!27327 (_ BitVec 32) List!7859) Bool)

(assert (=> b!443611 (= res!262896 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7856))))

(declare-fun b!443612 () Bool)

(assert (=> b!443612 (= e!260985 false)))

(declare-fun lt!203362 () Bool)

(assert (=> b!443612 (= lt!203362 (arrayNoDuplicates!0 lt!203363 #b00000000000000000000000000000000 Nil!7856))))

(assert (= (and start!40372 res!262900) b!443605))

(assert (= (and b!443605 res!262895) b!443601))

(assert (= (and b!443601 res!262899) b!443606))

(assert (= (and b!443606 res!262893) b!443611))

(assert (= (and b!443611 res!262896) b!443607))

(assert (= (and b!443607 res!262897) b!443600))

(assert (= (and b!443600 res!262894) b!443602))

(assert (= (and b!443602 res!262892) b!443603))

(assert (= (and b!443603 res!262898) b!443610))

(assert (= (and b!443610 res!262891) b!443612))

(assert (= (and b!443604 condMapEmpty!19263) mapIsEmpty!19263))

(assert (= (and b!443604 (not condMapEmpty!19263)) mapNonEmpty!19263))

(get-info :version)

(assert (= (and mapNonEmpty!19263 ((_ is ValueCellFull!5535) mapValue!19263)) b!443609))

(assert (= (and b!443604 ((_ is ValueCellFull!5535) mapDefault!19263)) b!443608))

(assert (= start!40372 b!443604))

(declare-fun m!429805 () Bool)

(assert (=> b!443600 m!429805))

(declare-fun m!429807 () Bool)

(assert (=> b!443606 m!429807))

(declare-fun m!429809 () Bool)

(assert (=> b!443610 m!429809))

(declare-fun m!429811 () Bool)

(assert (=> b!443610 m!429811))

(declare-fun m!429813 () Bool)

(assert (=> b!443603 m!429813))

(declare-fun m!429815 () Bool)

(assert (=> b!443605 m!429815))

(declare-fun m!429817 () Bool)

(assert (=> start!40372 m!429817))

(declare-fun m!429819 () Bool)

(assert (=> start!40372 m!429819))

(declare-fun m!429821 () Bool)

(assert (=> mapNonEmpty!19263 m!429821))

(declare-fun m!429823 () Bool)

(assert (=> b!443611 m!429823))

(declare-fun m!429825 () Bool)

(assert (=> b!443612 m!429825))

(declare-fun m!429827 () Bool)

(assert (=> b!443602 m!429827))

(check-sat (not mapNonEmpty!19263) (not b!443611) (not b!443600) (not start!40372) (not b!443610) (not b!443605) tp_is_empty!11757 (not b!443603) (not b!443606) (not b!443612))
(check-sat)
