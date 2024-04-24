; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40428 () Bool)

(assert start!40428)

(declare-fun b!444916 () Bool)

(declare-fun e!261583 () Bool)

(assert (=> b!444916 (= e!261583 false)))

(declare-fun lt!203592 () Bool)

(declare-datatypes ((array!27468 0))(
  ( (array!27469 (arr!13181 (Array (_ BitVec 32) (_ BitVec 64))) (size!13533 (_ BitVec 32))) )
))
(declare-fun lt!203591 () array!27468)

(declare-datatypes ((List!7796 0))(
  ( (Nil!7793) (Cons!7792 (h!8648 (_ BitVec 64)) (t!13546 List!7796)) )
))
(declare-fun arrayNoDuplicates!0 (array!27468 (_ BitVec 32) List!7796) Bool)

(assert (=> b!444916 (= lt!203592 (arrayNoDuplicates!0 lt!203591 #b00000000000000000000000000000000 Nil!7793))))

(declare-fun b!444917 () Bool)

(declare-fun res!263939 () Bool)

(declare-fun e!261587 () Bool)

(assert (=> b!444917 (=> (not res!263939) (not e!261587))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444917 (= res!263939 (validMask!0 mask!1025))))

(declare-fun b!444918 () Bool)

(declare-fun res!263938 () Bool)

(assert (=> b!444918 (=> (not res!263938) (not e!261587))))

(declare-fun _keys!709 () array!27468)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444918 (= res!263938 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444919 () Bool)

(declare-fun res!263943 () Bool)

(assert (=> b!444919 (=> (not res!263943) (not e!261587))))

(assert (=> b!444919 (= res!263943 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7793))))

(declare-fun b!444920 () Bool)

(declare-fun res!263946 () Bool)

(assert (=> b!444920 (=> (not res!263946) (not e!261587))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16875 0))(
  ( (V!16876 (val!5958 Int)) )
))
(declare-datatypes ((ValueCell!5570 0))(
  ( (ValueCellFull!5570 (v!8210 V!16875)) (EmptyCell!5570) )
))
(declare-datatypes ((array!27470 0))(
  ( (array!27471 (arr!13182 (Array (_ BitVec 32) ValueCell!5570)) (size!13534 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27470)

(assert (=> b!444920 (= res!263946 (and (= (size!13534 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13533 _keys!709) (size!13534 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444921 () Bool)

(declare-fun res!263940 () Bool)

(assert (=> b!444921 (=> (not res!263940) (not e!261587))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444921 (= res!263940 (or (= (select (arr!13181 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13181 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444922 () Bool)

(declare-fun res!263944 () Bool)

(assert (=> b!444922 (=> (not res!263944) (not e!261587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27468 (_ BitVec 32)) Bool)

(assert (=> b!444922 (= res!263944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444923 () Bool)

(declare-fun e!261585 () Bool)

(declare-fun tp_is_empty!11827 () Bool)

(assert (=> b!444923 (= e!261585 tp_is_empty!11827)))

(declare-fun b!444924 () Bool)

(declare-fun res!263945 () Bool)

(assert (=> b!444924 (=> (not res!263945) (not e!261587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444924 (= res!263945 (validKeyInArray!0 k0!794))))

(declare-fun b!444925 () Bool)

(declare-fun e!261588 () Bool)

(assert (=> b!444925 (= e!261588 tp_is_empty!11827)))

(declare-fun mapNonEmpty!19368 () Bool)

(declare-fun mapRes!19368 () Bool)

(declare-fun tp!37350 () Bool)

(assert (=> mapNonEmpty!19368 (= mapRes!19368 (and tp!37350 e!261585))))

(declare-fun mapValue!19368 () ValueCell!5570)

(declare-fun mapRest!19368 () (Array (_ BitVec 32) ValueCell!5570))

(declare-fun mapKey!19368 () (_ BitVec 32))

(assert (=> mapNonEmpty!19368 (= (arr!13182 _values!549) (store mapRest!19368 mapKey!19368 mapValue!19368))))

(declare-fun res!263947 () Bool)

(assert (=> start!40428 (=> (not res!263947) (not e!261587))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40428 (= res!263947 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13533 _keys!709))))))

(assert (=> start!40428 e!261587))

(assert (=> start!40428 true))

(declare-fun e!261584 () Bool)

(declare-fun array_inv!9636 (array!27470) Bool)

(assert (=> start!40428 (and (array_inv!9636 _values!549) e!261584)))

(declare-fun array_inv!9637 (array!27468) Bool)

(assert (=> start!40428 (array_inv!9637 _keys!709)))

(declare-fun mapIsEmpty!19368 () Bool)

(assert (=> mapIsEmpty!19368 mapRes!19368))

(declare-fun b!444926 () Bool)

(declare-fun res!263942 () Bool)

(assert (=> b!444926 (=> (not res!263942) (not e!261587))))

(assert (=> b!444926 (= res!263942 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13533 _keys!709))))))

(declare-fun b!444927 () Bool)

(assert (=> b!444927 (= e!261584 (and e!261588 mapRes!19368))))

(declare-fun condMapEmpty!19368 () Bool)

(declare-fun mapDefault!19368 () ValueCell!5570)

(assert (=> b!444927 (= condMapEmpty!19368 (= (arr!13182 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5570)) mapDefault!19368)))))

(declare-fun b!444928 () Bool)

(assert (=> b!444928 (= e!261587 e!261583)))

(declare-fun res!263941 () Bool)

(assert (=> b!444928 (=> (not res!263941) (not e!261583))))

(assert (=> b!444928 (= res!263941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203591 mask!1025))))

(assert (=> b!444928 (= lt!203591 (array!27469 (store (arr!13181 _keys!709) i!563 k0!794) (size!13533 _keys!709)))))

(assert (= (and start!40428 res!263947) b!444917))

(assert (= (and b!444917 res!263939) b!444920))

(assert (= (and b!444920 res!263946) b!444922))

(assert (= (and b!444922 res!263944) b!444919))

(assert (= (and b!444919 res!263943) b!444926))

(assert (= (and b!444926 res!263942) b!444924))

(assert (= (and b!444924 res!263945) b!444921))

(assert (= (and b!444921 res!263940) b!444918))

(assert (= (and b!444918 res!263938) b!444928))

(assert (= (and b!444928 res!263941) b!444916))

(assert (= (and b!444927 condMapEmpty!19368) mapIsEmpty!19368))

(assert (= (and b!444927 (not condMapEmpty!19368)) mapNonEmpty!19368))

(get-info :version)

(assert (= (and mapNonEmpty!19368 ((_ is ValueCellFull!5570) mapValue!19368)) b!444923))

(assert (= (and b!444927 ((_ is ValueCellFull!5570) mapDefault!19368)) b!444925))

(assert (= start!40428 b!444927))

(declare-fun m!430863 () Bool)

(assert (=> b!444916 m!430863))

(declare-fun m!430865 () Bool)

(assert (=> b!444928 m!430865))

(declare-fun m!430867 () Bool)

(assert (=> b!444928 m!430867))

(declare-fun m!430869 () Bool)

(assert (=> mapNonEmpty!19368 m!430869))

(declare-fun m!430871 () Bool)

(assert (=> b!444921 m!430871))

(declare-fun m!430873 () Bool)

(assert (=> b!444918 m!430873))

(declare-fun m!430875 () Bool)

(assert (=> b!444924 m!430875))

(declare-fun m!430877 () Bool)

(assert (=> b!444919 m!430877))

(declare-fun m!430879 () Bool)

(assert (=> b!444922 m!430879))

(declare-fun m!430881 () Bool)

(assert (=> start!40428 m!430881))

(declare-fun m!430883 () Bool)

(assert (=> start!40428 m!430883))

(declare-fun m!430885 () Bool)

(assert (=> b!444917 m!430885))

(check-sat (not b!444918) (not b!444917) (not b!444928) tp_is_empty!11827 (not mapNonEmpty!19368) (not b!444916) (not b!444919) (not b!444924) (not start!40428) (not b!444922))
(check-sat)
