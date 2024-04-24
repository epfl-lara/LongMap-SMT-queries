; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39662 () Bool)

(assert start!39662)

(declare-fun b_free!9943 () Bool)

(declare-fun b_next!9943 () Bool)

(assert (=> start!39662 (= b_free!9943 (not b_next!9943))))

(declare-fun tp!35357 () Bool)

(declare-fun b_and!17613 () Bool)

(assert (=> start!39662 (= tp!35357 b_and!17613)))

(declare-fun b!425998 () Bool)

(declare-fun res!249581 () Bool)

(declare-fun e!252797 () Bool)

(assert (=> b!425998 (=> (not res!249581) (not e!252797))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425998 (= res!249581 (validMask!0 mask!1025))))

(declare-fun b!425999 () Bool)

(declare-fun e!252799 () Bool)

(declare-fun e!252801 () Bool)

(assert (=> b!425999 (= e!252799 e!252801)))

(declare-fun res!249584 () Bool)

(assert (=> b!425999 (=> (not res!249584) (not e!252801))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425999 (= res!249584 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15899 0))(
  ( (V!15900 (val!5592 Int)) )
))
(declare-fun minValue!515 () V!15899)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15899)

(declare-datatypes ((tuple2!7244 0))(
  ( (tuple2!7245 (_1!3633 (_ BitVec 64)) (_2!3633 V!15899)) )
))
(declare-datatypes ((List!7253 0))(
  ( (Nil!7250) (Cons!7249 (h!8105 tuple2!7244) (t!12689 List!7253)) )
))
(declare-datatypes ((ListLongMap!6159 0))(
  ( (ListLongMap!6160 (toList!3095 List!7253)) )
))
(declare-fun lt!194859 () ListLongMap!6159)

(declare-datatypes ((array!26036 0))(
  ( (array!26037 (arr!12467 (Array (_ BitVec 32) (_ BitVec 64))) (size!12819 (_ BitVec 32))) )
))
(declare-fun lt!194862 () array!26036)

(declare-datatypes ((ValueCell!5204 0))(
  ( (ValueCellFull!5204 (v!7840 V!15899)) (EmptyCell!5204) )
))
(declare-datatypes ((array!26038 0))(
  ( (array!26039 (arr!12468 (Array (_ BitVec 32) ValueCell!5204)) (size!12820 (_ BitVec 32))) )
))
(declare-fun lt!194858 () array!26038)

(declare-fun getCurrentListMapNoExtraKeys!1341 (array!26036 array!26038 (_ BitVec 32) (_ BitVec 32) V!15899 V!15899 (_ BitVec 32) Int) ListLongMap!6159)

(assert (=> b!425999 (= lt!194859 (getCurrentListMapNoExtraKeys!1341 lt!194862 lt!194858 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26038)

(declare-fun v!412 () V!15899)

(assert (=> b!425999 (= lt!194858 (array!26039 (store (arr!12468 _values!549) i!563 (ValueCellFull!5204 v!412)) (size!12820 _values!549)))))

(declare-fun lt!194860 () ListLongMap!6159)

(declare-fun _keys!709 () array!26036)

(assert (=> b!425999 (= lt!194860 (getCurrentListMapNoExtraKeys!1341 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426000 () Bool)

(declare-fun res!249588 () Bool)

(assert (=> b!426000 (=> (not res!249588) (not e!252797))))

(assert (=> b!426000 (= res!249588 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12819 _keys!709))))))

(declare-fun b!426001 () Bool)

(declare-fun res!249587 () Bool)

(assert (=> b!426001 (=> (not res!249587) (not e!252797))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426001 (= res!249587 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426002 () Bool)

(declare-fun e!252802 () Bool)

(declare-fun e!252800 () Bool)

(declare-fun mapRes!18264 () Bool)

(assert (=> b!426002 (= e!252802 (and e!252800 mapRes!18264))))

(declare-fun condMapEmpty!18264 () Bool)

(declare-fun mapDefault!18264 () ValueCell!5204)

(assert (=> b!426002 (= condMapEmpty!18264 (= (arr!12468 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5204)) mapDefault!18264)))))

(declare-fun b!426003 () Bool)

(assert (=> b!426003 (= e!252797 e!252799)))

(declare-fun res!249580 () Bool)

(assert (=> b!426003 (=> (not res!249580) (not e!252799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26036 (_ BitVec 32)) Bool)

(assert (=> b!426003 (= res!249580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194862 mask!1025))))

(assert (=> b!426003 (= lt!194862 (array!26037 (store (arr!12467 _keys!709) i!563 k0!794) (size!12819 _keys!709)))))

(declare-fun b!426004 () Bool)

(declare-fun res!249585 () Bool)

(assert (=> b!426004 (=> (not res!249585) (not e!252797))))

(assert (=> b!426004 (= res!249585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!249579 () Bool)

(assert (=> start!39662 (=> (not res!249579) (not e!252797))))

(assert (=> start!39662 (= res!249579 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12819 _keys!709))))))

(assert (=> start!39662 e!252797))

(declare-fun tp_is_empty!11095 () Bool)

(assert (=> start!39662 tp_is_empty!11095))

(assert (=> start!39662 tp!35357))

(assert (=> start!39662 true))

(declare-fun array_inv!9156 (array!26038) Bool)

(assert (=> start!39662 (and (array_inv!9156 _values!549) e!252802)))

(declare-fun array_inv!9157 (array!26036) Bool)

(assert (=> start!39662 (array_inv!9157 _keys!709)))

(declare-fun b!426005 () Bool)

(assert (=> b!426005 (= e!252801 (not true))))

(declare-fun +!1310 (ListLongMap!6159 tuple2!7244) ListLongMap!6159)

(assert (=> b!426005 (= (getCurrentListMapNoExtraKeys!1341 lt!194862 lt!194858 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1310 (getCurrentListMapNoExtraKeys!1341 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7245 k0!794 v!412)))))

(declare-datatypes ((Unit!12495 0))(
  ( (Unit!12496) )
))
(declare-fun lt!194861 () Unit!12495)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!494 (array!26036 array!26038 (_ BitVec 32) (_ BitVec 32) V!15899 V!15899 (_ BitVec 32) (_ BitVec 64) V!15899 (_ BitVec 32) Int) Unit!12495)

(assert (=> b!426005 (= lt!194861 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!494 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426006 () Bool)

(declare-fun res!249578 () Bool)

(assert (=> b!426006 (=> (not res!249578) (not e!252797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426006 (= res!249578 (validKeyInArray!0 k0!794))))

(declare-fun b!426007 () Bool)

(declare-fun e!252798 () Bool)

(assert (=> b!426007 (= e!252798 tp_is_empty!11095)))

(declare-fun b!426008 () Bool)

(assert (=> b!426008 (= e!252800 tp_is_empty!11095)))

(declare-fun mapNonEmpty!18264 () Bool)

(declare-fun tp!35358 () Bool)

(assert (=> mapNonEmpty!18264 (= mapRes!18264 (and tp!35358 e!252798))))

(declare-fun mapKey!18264 () (_ BitVec 32))

(declare-fun mapValue!18264 () ValueCell!5204)

(declare-fun mapRest!18264 () (Array (_ BitVec 32) ValueCell!5204))

(assert (=> mapNonEmpty!18264 (= (arr!12468 _values!549) (store mapRest!18264 mapKey!18264 mapValue!18264))))

(declare-fun b!426009 () Bool)

(declare-fun res!249576 () Bool)

(assert (=> b!426009 (=> (not res!249576) (not e!252799))))

(assert (=> b!426009 (= res!249576 (bvsle from!863 i!563))))

(declare-fun b!426010 () Bool)

(declare-fun res!249583 () Bool)

(assert (=> b!426010 (=> (not res!249583) (not e!252797))))

(declare-datatypes ((List!7254 0))(
  ( (Nil!7251) (Cons!7250 (h!8106 (_ BitVec 64)) (t!12690 List!7254)) )
))
(declare-fun arrayNoDuplicates!0 (array!26036 (_ BitVec 32) List!7254) Bool)

(assert (=> b!426010 (= res!249583 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7251))))

(declare-fun b!426011 () Bool)

(declare-fun res!249586 () Bool)

(assert (=> b!426011 (=> (not res!249586) (not e!252799))))

(assert (=> b!426011 (= res!249586 (arrayNoDuplicates!0 lt!194862 #b00000000000000000000000000000000 Nil!7251))))

(declare-fun mapIsEmpty!18264 () Bool)

(assert (=> mapIsEmpty!18264 mapRes!18264))

(declare-fun b!426012 () Bool)

(declare-fun res!249582 () Bool)

(assert (=> b!426012 (=> (not res!249582) (not e!252797))))

(assert (=> b!426012 (= res!249582 (and (= (size!12820 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12819 _keys!709) (size!12820 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426013 () Bool)

(declare-fun res!249577 () Bool)

(assert (=> b!426013 (=> (not res!249577) (not e!252797))))

(assert (=> b!426013 (= res!249577 (or (= (select (arr!12467 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12467 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39662 res!249579) b!425998))

(assert (= (and b!425998 res!249581) b!426012))

(assert (= (and b!426012 res!249582) b!426004))

(assert (= (and b!426004 res!249585) b!426010))

(assert (= (and b!426010 res!249583) b!426000))

(assert (= (and b!426000 res!249588) b!426006))

(assert (= (and b!426006 res!249578) b!426013))

(assert (= (and b!426013 res!249577) b!426001))

(assert (= (and b!426001 res!249587) b!426003))

(assert (= (and b!426003 res!249580) b!426011))

(assert (= (and b!426011 res!249586) b!426009))

(assert (= (and b!426009 res!249576) b!425999))

(assert (= (and b!425999 res!249584) b!426005))

(assert (= (and b!426002 condMapEmpty!18264) mapIsEmpty!18264))

(assert (= (and b!426002 (not condMapEmpty!18264)) mapNonEmpty!18264))

(get-info :version)

(assert (= (and mapNonEmpty!18264 ((_ is ValueCellFull!5204) mapValue!18264)) b!426007))

(assert (= (and b!426002 ((_ is ValueCellFull!5204) mapDefault!18264)) b!426008))

(assert (= start!39662 b!426002))

(declare-fun m!415037 () Bool)

(assert (=> b!426013 m!415037))

(declare-fun m!415039 () Bool)

(assert (=> b!425999 m!415039))

(declare-fun m!415041 () Bool)

(assert (=> b!425999 m!415041))

(declare-fun m!415043 () Bool)

(assert (=> b!425999 m!415043))

(declare-fun m!415045 () Bool)

(assert (=> b!426010 m!415045))

(declare-fun m!415047 () Bool)

(assert (=> b!426004 m!415047))

(declare-fun m!415049 () Bool)

(assert (=> b!426001 m!415049))

(declare-fun m!415051 () Bool)

(assert (=> mapNonEmpty!18264 m!415051))

(declare-fun m!415053 () Bool)

(assert (=> b!425998 m!415053))

(declare-fun m!415055 () Bool)

(assert (=> b!426006 m!415055))

(declare-fun m!415057 () Bool)

(assert (=> b!426005 m!415057))

(declare-fun m!415059 () Bool)

(assert (=> b!426005 m!415059))

(assert (=> b!426005 m!415059))

(declare-fun m!415061 () Bool)

(assert (=> b!426005 m!415061))

(declare-fun m!415063 () Bool)

(assert (=> b!426005 m!415063))

(declare-fun m!415065 () Bool)

(assert (=> b!426003 m!415065))

(declare-fun m!415067 () Bool)

(assert (=> b!426003 m!415067))

(declare-fun m!415069 () Bool)

(assert (=> b!426011 m!415069))

(declare-fun m!415071 () Bool)

(assert (=> start!39662 m!415071))

(declare-fun m!415073 () Bool)

(assert (=> start!39662 m!415073))

(check-sat (not b!425998) (not b!426004) tp_is_empty!11095 (not b!426005) (not mapNonEmpty!18264) (not b!426001) (not b_next!9943) (not start!39662) (not b!425999) (not b!426010) b_and!17613 (not b!426006) (not b!426011) (not b!426003))
(check-sat b_and!17613 (not b_next!9943))
