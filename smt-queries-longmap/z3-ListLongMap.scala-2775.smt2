; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40524 () Bool)

(assert start!40524)

(declare-fun b!446502 () Bool)

(declare-fun res!265035 () Bool)

(declare-fun e!262311 () Bool)

(assert (=> b!446502 (=> (not res!265035) (not e!262311))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446502 (= res!265035 (validMask!0 mask!1025))))

(declare-fun b!446503 () Bool)

(declare-fun e!262310 () Bool)

(declare-fun e!262313 () Bool)

(declare-fun mapRes!19464 () Bool)

(assert (=> b!446503 (= e!262310 (and e!262313 mapRes!19464))))

(declare-fun condMapEmpty!19464 () Bool)

(declare-datatypes ((V!16957 0))(
  ( (V!16958 (val!5989 Int)) )
))
(declare-datatypes ((ValueCell!5601 0))(
  ( (ValueCellFull!5601 (v!8244 V!16957)) (EmptyCell!5601) )
))
(declare-datatypes ((array!27585 0))(
  ( (array!27586 (arr!13239 (Array (_ BitVec 32) ValueCell!5601)) (size!13591 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27585)

(declare-fun mapDefault!19464 () ValueCell!5601)

(assert (=> b!446503 (= condMapEmpty!19464 (= (arr!13239 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5601)) mapDefault!19464)))))

(declare-fun b!446504 () Bool)

(declare-fun res!265033 () Bool)

(assert (=> b!446504 (=> (not res!265033) (not e!262311))))

(declare-datatypes ((array!27587 0))(
  ( (array!27588 (arr!13240 (Array (_ BitVec 32) (_ BitVec 64))) (size!13592 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27587)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27587 (_ BitVec 32)) Bool)

(assert (=> b!446504 (= res!265033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446505 () Bool)

(declare-fun res!265037 () Bool)

(assert (=> b!446505 (=> (not res!265037) (not e!262311))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!446505 (= res!265037 (and (= (size!13591 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13592 _keys!709) (size!13591 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19464 () Bool)

(declare-fun tp!37491 () Bool)

(declare-fun e!262309 () Bool)

(assert (=> mapNonEmpty!19464 (= mapRes!19464 (and tp!37491 e!262309))))

(declare-fun mapKey!19464 () (_ BitVec 32))

(declare-fun mapValue!19464 () ValueCell!5601)

(declare-fun mapRest!19464 () (Array (_ BitVec 32) ValueCell!5601))

(assert (=> mapNonEmpty!19464 (= (arr!13239 _values!549) (store mapRest!19464 mapKey!19464 mapValue!19464))))

(declare-fun b!446506 () Bool)

(declare-fun tp_is_empty!11889 () Bool)

(assert (=> b!446506 (= e!262309 tp_is_empty!11889)))

(declare-fun b!446508 () Bool)

(declare-fun e!262312 () Bool)

(assert (=> b!446508 (= e!262311 e!262312)))

(declare-fun res!265038 () Bool)

(assert (=> b!446508 (=> (not res!265038) (not e!262312))))

(declare-fun lt!203819 () array!27587)

(assert (=> b!446508 (= res!265038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203819 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446508 (= lt!203819 (array!27588 (store (arr!13240 _keys!709) i!563 k0!794) (size!13592 _keys!709)))))

(declare-fun b!446509 () Bool)

(assert (=> b!446509 (= e!262312 false)))

(declare-fun lt!203818 () Bool)

(declare-datatypes ((List!7920 0))(
  ( (Nil!7917) (Cons!7916 (h!8772 (_ BitVec 64)) (t!13680 List!7920)) )
))
(declare-fun arrayNoDuplicates!0 (array!27587 (_ BitVec 32) List!7920) Bool)

(assert (=> b!446509 (= lt!203818 (arrayNoDuplicates!0 lt!203819 #b00000000000000000000000000000000 Nil!7917))))

(declare-fun b!446510 () Bool)

(declare-fun res!265034 () Bool)

(assert (=> b!446510 (=> (not res!265034) (not e!262311))))

(declare-fun arrayContainsKey!0 (array!27587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446510 (= res!265034 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446511 () Bool)

(declare-fun res!265032 () Bool)

(assert (=> b!446511 (=> (not res!265032) (not e!262311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446511 (= res!265032 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!19464 () Bool)

(assert (=> mapIsEmpty!19464 mapRes!19464))

(declare-fun b!446512 () Bool)

(declare-fun res!265030 () Bool)

(assert (=> b!446512 (=> (not res!265030) (not e!262311))))

(assert (=> b!446512 (= res!265030 (or (= (select (arr!13240 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13240 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446507 () Bool)

(declare-fun res!265029 () Bool)

(assert (=> b!446507 (=> (not res!265029) (not e!262311))))

(assert (=> b!446507 (= res!265029 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7917))))

(declare-fun res!265031 () Bool)

(assert (=> start!40524 (=> (not res!265031) (not e!262311))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40524 (= res!265031 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13592 _keys!709))))))

(assert (=> start!40524 e!262311))

(assert (=> start!40524 true))

(declare-fun array_inv!9600 (array!27585) Bool)

(assert (=> start!40524 (and (array_inv!9600 _values!549) e!262310)))

(declare-fun array_inv!9601 (array!27587) Bool)

(assert (=> start!40524 (array_inv!9601 _keys!709)))

(declare-fun b!446513 () Bool)

(assert (=> b!446513 (= e!262313 tp_is_empty!11889)))

(declare-fun b!446514 () Bool)

(declare-fun res!265036 () Bool)

(assert (=> b!446514 (=> (not res!265036) (not e!262311))))

(assert (=> b!446514 (= res!265036 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13592 _keys!709))))))

(assert (= (and start!40524 res!265031) b!446502))

(assert (= (and b!446502 res!265035) b!446505))

(assert (= (and b!446505 res!265037) b!446504))

(assert (= (and b!446504 res!265033) b!446507))

(assert (= (and b!446507 res!265029) b!446514))

(assert (= (and b!446514 res!265036) b!446511))

(assert (= (and b!446511 res!265032) b!446512))

(assert (= (and b!446512 res!265030) b!446510))

(assert (= (and b!446510 res!265034) b!446508))

(assert (= (and b!446508 res!265038) b!446509))

(assert (= (and b!446503 condMapEmpty!19464) mapIsEmpty!19464))

(assert (= (and b!446503 (not condMapEmpty!19464)) mapNonEmpty!19464))

(get-info :version)

(assert (= (and mapNonEmpty!19464 ((_ is ValueCellFull!5601) mapValue!19464)) b!446506))

(assert (= (and b!446503 ((_ is ValueCellFull!5601) mapDefault!19464)) b!446513))

(assert (= start!40524 b!446503))

(declare-fun m!431721 () Bool)

(assert (=> mapNonEmpty!19464 m!431721))

(declare-fun m!431723 () Bool)

(assert (=> b!446512 m!431723))

(declare-fun m!431725 () Bool)

(assert (=> start!40524 m!431725))

(declare-fun m!431727 () Bool)

(assert (=> start!40524 m!431727))

(declare-fun m!431729 () Bool)

(assert (=> b!446502 m!431729))

(declare-fun m!431731 () Bool)

(assert (=> b!446504 m!431731))

(declare-fun m!431733 () Bool)

(assert (=> b!446508 m!431733))

(declare-fun m!431735 () Bool)

(assert (=> b!446508 m!431735))

(declare-fun m!431737 () Bool)

(assert (=> b!446507 m!431737))

(declare-fun m!431739 () Bool)

(assert (=> b!446510 m!431739))

(declare-fun m!431741 () Bool)

(assert (=> b!446511 m!431741))

(declare-fun m!431743 () Bool)

(assert (=> b!446509 m!431743))

(check-sat tp_is_empty!11889 (not b!446509) (not b!446507) (not b!446510) (not mapNonEmpty!19464) (not start!40524) (not b!446502) (not b!446511) (not b!446504) (not b!446508))
(check-sat)
