; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40518 () Bool)

(assert start!40518)

(declare-fun b!446385 () Bool)

(declare-fun res!264942 () Bool)

(declare-fun e!262258 () Bool)

(assert (=> b!446385 (=> (not res!264942) (not e!262258))))

(declare-datatypes ((array!27575 0))(
  ( (array!27576 (arr!13234 (Array (_ BitVec 32) (_ BitVec 64))) (size!13586 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27575)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446385 (= res!264942 (or (= (select (arr!13234 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13234 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446386 () Bool)

(declare-fun e!262259 () Bool)

(declare-fun tp_is_empty!11883 () Bool)

(assert (=> b!446386 (= e!262259 tp_is_empty!11883)))

(declare-fun b!446387 () Bool)

(declare-fun e!262255 () Bool)

(assert (=> b!446387 (= e!262258 e!262255)))

(declare-fun res!264941 () Bool)

(assert (=> b!446387 (=> (not res!264941) (not e!262255))))

(declare-fun lt!203801 () array!27575)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27575 (_ BitVec 32)) Bool)

(assert (=> b!446387 (= res!264941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203801 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!446387 (= lt!203801 (array!27576 (store (arr!13234 _keys!709) i!563 k0!794) (size!13586 _keys!709)))))

(declare-fun b!446388 () Bool)

(declare-fun e!262256 () Bool)

(assert (=> b!446388 (= e!262256 tp_is_empty!11883)))

(declare-fun b!446389 () Bool)

(declare-fun res!264947 () Bool)

(assert (=> b!446389 (=> (not res!264947) (not e!262258))))

(assert (=> b!446389 (= res!264947 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13586 _keys!709))))))

(declare-fun b!446390 () Bool)

(declare-fun res!264945 () Bool)

(assert (=> b!446390 (=> (not res!264945) (not e!262258))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16949 0))(
  ( (V!16950 (val!5986 Int)) )
))
(declare-datatypes ((ValueCell!5598 0))(
  ( (ValueCellFull!5598 (v!8241 V!16949)) (EmptyCell!5598) )
))
(declare-datatypes ((array!27577 0))(
  ( (array!27578 (arr!13235 (Array (_ BitVec 32) ValueCell!5598)) (size!13587 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27577)

(assert (=> b!446390 (= res!264945 (and (= (size!13587 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13586 _keys!709) (size!13587 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446391 () Bool)

(declare-fun res!264943 () Bool)

(assert (=> b!446391 (=> (not res!264943) (not e!262258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446391 (= res!264943 (validKeyInArray!0 k0!794))))

(declare-fun b!446392 () Bool)

(declare-fun res!264939 () Bool)

(assert (=> b!446392 (=> (not res!264939) (not e!262258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446392 (= res!264939 (validMask!0 mask!1025))))

(declare-fun res!264940 () Bool)

(assert (=> start!40518 (=> (not res!264940) (not e!262258))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40518 (= res!264940 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13586 _keys!709))))))

(assert (=> start!40518 e!262258))

(assert (=> start!40518 true))

(declare-fun e!262257 () Bool)

(declare-fun array_inv!9596 (array!27577) Bool)

(assert (=> start!40518 (and (array_inv!9596 _values!549) e!262257)))

(declare-fun array_inv!9597 (array!27575) Bool)

(assert (=> start!40518 (array_inv!9597 _keys!709)))

(declare-fun b!446393 () Bool)

(declare-fun res!264948 () Bool)

(assert (=> b!446393 (=> (not res!264948) (not e!262258))))

(declare-fun arrayContainsKey!0 (array!27575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446393 (= res!264948 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446394 () Bool)

(declare-fun mapRes!19455 () Bool)

(assert (=> b!446394 (= e!262257 (and e!262256 mapRes!19455))))

(declare-fun condMapEmpty!19455 () Bool)

(declare-fun mapDefault!19455 () ValueCell!5598)

(assert (=> b!446394 (= condMapEmpty!19455 (= (arr!13235 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5598)) mapDefault!19455)))))

(declare-fun b!446395 () Bool)

(declare-fun res!264944 () Bool)

(assert (=> b!446395 (=> (not res!264944) (not e!262258))))

(declare-datatypes ((List!7918 0))(
  ( (Nil!7915) (Cons!7914 (h!8770 (_ BitVec 64)) (t!13678 List!7918)) )
))
(declare-fun arrayNoDuplicates!0 (array!27575 (_ BitVec 32) List!7918) Bool)

(assert (=> b!446395 (= res!264944 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7915))))

(declare-fun b!446396 () Bool)

(declare-fun res!264946 () Bool)

(assert (=> b!446396 (=> (not res!264946) (not e!262258))))

(assert (=> b!446396 (= res!264946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446397 () Bool)

(assert (=> b!446397 (= e!262255 false)))

(declare-fun lt!203800 () Bool)

(assert (=> b!446397 (= lt!203800 (arrayNoDuplicates!0 lt!203801 #b00000000000000000000000000000000 Nil!7915))))

(declare-fun mapNonEmpty!19455 () Bool)

(declare-fun tp!37482 () Bool)

(assert (=> mapNonEmpty!19455 (= mapRes!19455 (and tp!37482 e!262259))))

(declare-fun mapRest!19455 () (Array (_ BitVec 32) ValueCell!5598))

(declare-fun mapValue!19455 () ValueCell!5598)

(declare-fun mapKey!19455 () (_ BitVec 32))

(assert (=> mapNonEmpty!19455 (= (arr!13235 _values!549) (store mapRest!19455 mapKey!19455 mapValue!19455))))

(declare-fun mapIsEmpty!19455 () Bool)

(assert (=> mapIsEmpty!19455 mapRes!19455))

(assert (= (and start!40518 res!264940) b!446392))

(assert (= (and b!446392 res!264939) b!446390))

(assert (= (and b!446390 res!264945) b!446396))

(assert (= (and b!446396 res!264946) b!446395))

(assert (= (and b!446395 res!264944) b!446389))

(assert (= (and b!446389 res!264947) b!446391))

(assert (= (and b!446391 res!264943) b!446385))

(assert (= (and b!446385 res!264942) b!446393))

(assert (= (and b!446393 res!264948) b!446387))

(assert (= (and b!446387 res!264941) b!446397))

(assert (= (and b!446394 condMapEmpty!19455) mapIsEmpty!19455))

(assert (= (and b!446394 (not condMapEmpty!19455)) mapNonEmpty!19455))

(get-info :version)

(assert (= (and mapNonEmpty!19455 ((_ is ValueCellFull!5598) mapValue!19455)) b!446386))

(assert (= (and b!446394 ((_ is ValueCellFull!5598) mapDefault!19455)) b!446388))

(assert (= start!40518 b!446394))

(declare-fun m!431649 () Bool)

(assert (=> b!446387 m!431649))

(declare-fun m!431651 () Bool)

(assert (=> b!446387 m!431651))

(declare-fun m!431653 () Bool)

(assert (=> b!446397 m!431653))

(declare-fun m!431655 () Bool)

(assert (=> b!446385 m!431655))

(declare-fun m!431657 () Bool)

(assert (=> mapNonEmpty!19455 m!431657))

(declare-fun m!431659 () Bool)

(assert (=> b!446395 m!431659))

(declare-fun m!431661 () Bool)

(assert (=> start!40518 m!431661))

(declare-fun m!431663 () Bool)

(assert (=> start!40518 m!431663))

(declare-fun m!431665 () Bool)

(assert (=> b!446391 m!431665))

(declare-fun m!431667 () Bool)

(assert (=> b!446392 m!431667))

(declare-fun m!431669 () Bool)

(assert (=> b!446393 m!431669))

(declare-fun m!431671 () Bool)

(assert (=> b!446396 m!431671))

(check-sat (not b!446392) (not b!446393) (not mapNonEmpty!19455) (not b!446387) (not start!40518) (not b!446391) (not b!446395) (not b!446397) tp_is_empty!11883 (not b!446396))
(check-sat)
