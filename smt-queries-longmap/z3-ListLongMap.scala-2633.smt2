; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39602 () Bool)

(assert start!39602)

(declare-fun b_free!9883 () Bool)

(declare-fun b_next!9883 () Bool)

(assert (=> start!39602 (= b_free!9883 (not b_next!9883))))

(declare-fun tp!35178 () Bool)

(declare-fun b_and!17553 () Bool)

(assert (=> start!39602 (= tp!35178 b_and!17553)))

(declare-fun b!424565 () Bool)

(declare-fun e!252178 () Bool)

(assert (=> b!424565 (= e!252178 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15819 0))(
  ( (V!15820 (val!5562 Int)) )
))
(declare-fun minValue!515 () V!15819)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5174 0))(
  ( (ValueCellFull!5174 (v!7810 V!15819)) (EmptyCell!5174) )
))
(declare-datatypes ((array!25916 0))(
  ( (array!25917 (arr!12407 (Array (_ BitVec 32) ValueCell!5174)) (size!12759 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25916)

(declare-fun zeroValue!515 () V!15819)

(declare-datatypes ((tuple2!7194 0))(
  ( (tuple2!7195 (_1!3608 (_ BitVec 64)) (_2!3608 V!15819)) )
))
(declare-datatypes ((List!7200 0))(
  ( (Nil!7197) (Cons!7196 (h!8052 tuple2!7194) (t!12636 List!7200)) )
))
(declare-datatypes ((ListLongMap!6109 0))(
  ( (ListLongMap!6110 (toList!3070 List!7200)) )
))
(declare-fun lt!194424 () ListLongMap!6109)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25918 0))(
  ( (array!25919 (arr!12408 (Array (_ BitVec 32) (_ BitVec 64))) (size!12760 (_ BitVec 32))) )
))
(declare-fun lt!194423 () array!25918)

(declare-fun v!412 () V!15819)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1316 (array!25918 array!25916 (_ BitVec 32) (_ BitVec 32) V!15819 V!15819 (_ BitVec 32) Int) ListLongMap!6109)

(assert (=> b!424565 (= lt!194424 (getCurrentListMapNoExtraKeys!1316 lt!194423 (array!25917 (store (arr!12407 _values!549) i!563 (ValueCellFull!5174 v!412)) (size!12759 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194422 () ListLongMap!6109)

(declare-fun _keys!709 () array!25918)

(assert (=> b!424565 (= lt!194422 (getCurrentListMapNoExtraKeys!1316 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424566 () Bool)

(declare-fun res!248422 () Bool)

(declare-fun e!252175 () Bool)

(assert (=> b!424566 (=> (not res!248422) (not e!252175))))

(declare-datatypes ((List!7201 0))(
  ( (Nil!7198) (Cons!7197 (h!8053 (_ BitVec 64)) (t!12637 List!7201)) )
))
(declare-fun arrayNoDuplicates!0 (array!25918 (_ BitVec 32) List!7201) Bool)

(assert (=> b!424566 (= res!248422 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7198))))

(declare-fun b!424567 () Bool)

(declare-fun e!252177 () Bool)

(declare-fun e!252173 () Bool)

(declare-fun mapRes!18174 () Bool)

(assert (=> b!424567 (= e!252177 (and e!252173 mapRes!18174))))

(declare-fun condMapEmpty!18174 () Bool)

(declare-fun mapDefault!18174 () ValueCell!5174)

(assert (=> b!424567 (= condMapEmpty!18174 (= (arr!12407 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5174)) mapDefault!18174)))))

(declare-fun res!248418 () Bool)

(assert (=> start!39602 (=> (not res!248418) (not e!252175))))

(assert (=> start!39602 (= res!248418 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12760 _keys!709))))))

(assert (=> start!39602 e!252175))

(declare-fun tp_is_empty!11035 () Bool)

(assert (=> start!39602 tp_is_empty!11035))

(assert (=> start!39602 tp!35178))

(assert (=> start!39602 true))

(declare-fun array_inv!9110 (array!25916) Bool)

(assert (=> start!39602 (and (array_inv!9110 _values!549) e!252177)))

(declare-fun array_inv!9111 (array!25918) Bool)

(assert (=> start!39602 (array_inv!9111 _keys!709)))

(declare-fun b!424568 () Bool)

(declare-fun res!248416 () Bool)

(assert (=> b!424568 (=> (not res!248416) (not e!252175))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424568 (= res!248416 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424569 () Bool)

(declare-fun res!248420 () Bool)

(assert (=> b!424569 (=> (not res!248420) (not e!252178))))

(assert (=> b!424569 (= res!248420 (bvsle from!863 i!563))))

(declare-fun b!424570 () Bool)

(assert (=> b!424570 (= e!252173 tp_is_empty!11035)))

(declare-fun mapNonEmpty!18174 () Bool)

(declare-fun tp!35177 () Bool)

(declare-fun e!252174 () Bool)

(assert (=> mapNonEmpty!18174 (= mapRes!18174 (and tp!35177 e!252174))))

(declare-fun mapValue!18174 () ValueCell!5174)

(declare-fun mapKey!18174 () (_ BitVec 32))

(declare-fun mapRest!18174 () (Array (_ BitVec 32) ValueCell!5174))

(assert (=> mapNonEmpty!18174 (= (arr!12407 _values!549) (store mapRest!18174 mapKey!18174 mapValue!18174))))

(declare-fun b!424571 () Bool)

(declare-fun res!248424 () Bool)

(assert (=> b!424571 (=> (not res!248424) (not e!252175))))

(assert (=> b!424571 (= res!248424 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12760 _keys!709))))))

(declare-fun b!424572 () Bool)

(assert (=> b!424572 (= e!252174 tp_is_empty!11035)))

(declare-fun b!424573 () Bool)

(declare-fun res!248421 () Bool)

(assert (=> b!424573 (=> (not res!248421) (not e!252178))))

(assert (=> b!424573 (= res!248421 (arrayNoDuplicates!0 lt!194423 #b00000000000000000000000000000000 Nil!7198))))

(declare-fun mapIsEmpty!18174 () Bool)

(assert (=> mapIsEmpty!18174 mapRes!18174))

(declare-fun b!424574 () Bool)

(declare-fun res!248413 () Bool)

(assert (=> b!424574 (=> (not res!248413) (not e!252175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25918 (_ BitVec 32)) Bool)

(assert (=> b!424574 (= res!248413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424575 () Bool)

(declare-fun res!248415 () Bool)

(assert (=> b!424575 (=> (not res!248415) (not e!252175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424575 (= res!248415 (validMask!0 mask!1025))))

(declare-fun b!424576 () Bool)

(assert (=> b!424576 (= e!252175 e!252178)))

(declare-fun res!248419 () Bool)

(assert (=> b!424576 (=> (not res!248419) (not e!252178))))

(assert (=> b!424576 (= res!248419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194423 mask!1025))))

(assert (=> b!424576 (= lt!194423 (array!25919 (store (arr!12408 _keys!709) i!563 k0!794) (size!12760 _keys!709)))))

(declare-fun b!424577 () Bool)

(declare-fun res!248417 () Bool)

(assert (=> b!424577 (=> (not res!248417) (not e!252175))))

(assert (=> b!424577 (= res!248417 (and (= (size!12759 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12760 _keys!709) (size!12759 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424578 () Bool)

(declare-fun res!248423 () Bool)

(assert (=> b!424578 (=> (not res!248423) (not e!252175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424578 (= res!248423 (validKeyInArray!0 k0!794))))

(declare-fun b!424579 () Bool)

(declare-fun res!248414 () Bool)

(assert (=> b!424579 (=> (not res!248414) (not e!252175))))

(assert (=> b!424579 (= res!248414 (or (= (select (arr!12408 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12408 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39602 res!248418) b!424575))

(assert (= (and b!424575 res!248415) b!424577))

(assert (= (and b!424577 res!248417) b!424574))

(assert (= (and b!424574 res!248413) b!424566))

(assert (= (and b!424566 res!248422) b!424571))

(assert (= (and b!424571 res!248424) b!424578))

(assert (= (and b!424578 res!248423) b!424579))

(assert (= (and b!424579 res!248414) b!424568))

(assert (= (and b!424568 res!248416) b!424576))

(assert (= (and b!424576 res!248419) b!424573))

(assert (= (and b!424573 res!248421) b!424569))

(assert (= (and b!424569 res!248420) b!424565))

(assert (= (and b!424567 condMapEmpty!18174) mapIsEmpty!18174))

(assert (= (and b!424567 (not condMapEmpty!18174)) mapNonEmpty!18174))

(get-info :version)

(assert (= (and mapNonEmpty!18174 ((_ is ValueCellFull!5174) mapValue!18174)) b!424572))

(assert (= (and b!424567 ((_ is ValueCellFull!5174) mapDefault!18174)) b!424570))

(assert (= start!39602 b!424567))

(declare-fun m!413921 () Bool)

(assert (=> start!39602 m!413921))

(declare-fun m!413923 () Bool)

(assert (=> start!39602 m!413923))

(declare-fun m!413925 () Bool)

(assert (=> b!424578 m!413925))

(declare-fun m!413927 () Bool)

(assert (=> b!424573 m!413927))

(declare-fun m!413929 () Bool)

(assert (=> b!424574 m!413929))

(declare-fun m!413931 () Bool)

(assert (=> b!424568 m!413931))

(declare-fun m!413933 () Bool)

(assert (=> b!424566 m!413933))

(declare-fun m!413935 () Bool)

(assert (=> b!424575 m!413935))

(declare-fun m!413937 () Bool)

(assert (=> b!424576 m!413937))

(declare-fun m!413939 () Bool)

(assert (=> b!424576 m!413939))

(declare-fun m!413941 () Bool)

(assert (=> b!424565 m!413941))

(declare-fun m!413943 () Bool)

(assert (=> b!424565 m!413943))

(declare-fun m!413945 () Bool)

(assert (=> b!424565 m!413945))

(declare-fun m!413947 () Bool)

(assert (=> b!424579 m!413947))

(declare-fun m!413949 () Bool)

(assert (=> mapNonEmpty!18174 m!413949))

(check-sat b_and!17553 (not b!424565) (not b_next!9883) (not mapNonEmpty!18174) (not b!424574) (not b!424566) (not b!424573) tp_is_empty!11035 (not b!424575) (not start!39602) (not b!424576) (not b!424568) (not b!424578))
(check-sat b_and!17553 (not b_next!9883))
