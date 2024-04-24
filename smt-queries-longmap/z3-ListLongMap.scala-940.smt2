; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20740 () Bool)

(assert start!20740)

(declare-fun b_free!5395 () Bool)

(declare-fun b_next!5395 () Bool)

(assert (=> start!20740 (= b_free!5395 (not b_next!5395))))

(declare-fun tp!19217 () Bool)

(declare-fun b_and!12155 () Bool)

(assert (=> start!20740 (= tp!19217 b_and!12155)))

(declare-fun mapIsEmpty!8945 () Bool)

(declare-fun mapRes!8945 () Bool)

(assert (=> mapIsEmpty!8945 mapRes!8945))

(declare-fun b!207583 () Bool)

(declare-fun res!100799 () Bool)

(declare-fun e!135500 () Bool)

(assert (=> b!207583 (=> (not res!100799) (not e!135500))))

(declare-datatypes ((array!9705 0))(
  ( (array!9706 (arr!4603 (Array (_ BitVec 32) (_ BitVec 64))) (size!4928 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9705)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9705 (_ BitVec 32)) Bool)

(assert (=> b!207583 (= res!100799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207584 () Bool)

(assert (=> b!207584 (= e!135500 (not true))))

(declare-datatypes ((V!6649 0))(
  ( (V!6650 (val!2670 Int)) )
))
(declare-datatypes ((tuple2!3996 0))(
  ( (tuple2!3997 (_1!2009 (_ BitVec 64)) (_2!2009 V!6649)) )
))
(declare-datatypes ((List!2885 0))(
  ( (Nil!2882) (Cons!2881 (h!3523 tuple2!3996) (t!7808 List!2885)) )
))
(declare-datatypes ((ListLongMap!2911 0))(
  ( (ListLongMap!2912 (toList!1471 List!2885)) )
))
(declare-fun lt!106407 () ListLongMap!2911)

(declare-datatypes ((ValueCell!2282 0))(
  ( (ValueCellFull!2282 (v!4641 V!6649)) (EmptyCell!2282) )
))
(declare-datatypes ((array!9707 0))(
  ( (array!9708 (arr!4604 (Array (_ BitVec 32) ValueCell!2282)) (size!4929 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9707)

(declare-fun zeroValue!615 () V!6649)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6649)

(declare-fun getCurrentListMap!1041 (array!9705 array!9707 (_ BitVec 32) (_ BitVec 32) V!6649 V!6649 (_ BitVec 32) Int) ListLongMap!2911)

(assert (=> b!207584 (= lt!106407 (getCurrentListMap!1041 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106408 () array!9707)

(declare-fun lt!106409 () ListLongMap!2911)

(assert (=> b!207584 (= lt!106409 (getCurrentListMap!1041 _keys!825 lt!106408 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106411 () ListLongMap!2911)

(declare-fun lt!106410 () ListLongMap!2911)

(assert (=> b!207584 (and (= lt!106411 lt!106410) (= lt!106410 lt!106411))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!106406 () ListLongMap!2911)

(declare-fun v!520 () V!6649)

(declare-fun +!525 (ListLongMap!2911 tuple2!3996) ListLongMap!2911)

(assert (=> b!207584 (= lt!106410 (+!525 lt!106406 (tuple2!3997 k0!843 v!520)))))

(declare-datatypes ((Unit!6326 0))(
  ( (Unit!6327) )
))
(declare-fun lt!106412 () Unit!6326)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!177 (array!9705 array!9707 (_ BitVec 32) (_ BitVec 32) V!6649 V!6649 (_ BitVec 32) (_ BitVec 64) V!6649 (_ BitVec 32) Int) Unit!6326)

(assert (=> b!207584 (= lt!106412 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!177 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!434 (array!9705 array!9707 (_ BitVec 32) (_ BitVec 32) V!6649 V!6649 (_ BitVec 32) Int) ListLongMap!2911)

(assert (=> b!207584 (= lt!106411 (getCurrentListMapNoExtraKeys!434 _keys!825 lt!106408 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207584 (= lt!106408 (array!9708 (store (arr!4604 _values!649) i!601 (ValueCellFull!2282 v!520)) (size!4929 _values!649)))))

(assert (=> b!207584 (= lt!106406 (getCurrentListMapNoExtraKeys!434 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207585 () Bool)

(declare-fun res!100796 () Bool)

(assert (=> b!207585 (=> (not res!100796) (not e!135500))))

(declare-datatypes ((List!2886 0))(
  ( (Nil!2883) (Cons!2882 (h!3524 (_ BitVec 64)) (t!7809 List!2886)) )
))
(declare-fun arrayNoDuplicates!0 (array!9705 (_ BitVec 32) List!2886) Bool)

(assert (=> b!207585 (= res!100796 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2883))))

(declare-fun b!207586 () Bool)

(declare-fun e!135502 () Bool)

(declare-fun e!135503 () Bool)

(assert (=> b!207586 (= e!135502 (and e!135503 mapRes!8945))))

(declare-fun condMapEmpty!8945 () Bool)

(declare-fun mapDefault!8945 () ValueCell!2282)

(assert (=> b!207586 (= condMapEmpty!8945 (= (arr!4604 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2282)) mapDefault!8945)))))

(declare-fun b!207587 () Bool)

(declare-fun res!100798 () Bool)

(assert (=> b!207587 (=> (not res!100798) (not e!135500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207587 (= res!100798 (validKeyInArray!0 k0!843))))

(declare-fun res!100795 () Bool)

(assert (=> start!20740 (=> (not res!100795) (not e!135500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20740 (= res!100795 (validMask!0 mask!1149))))

(assert (=> start!20740 e!135500))

(declare-fun array_inv!3013 (array!9707) Bool)

(assert (=> start!20740 (and (array_inv!3013 _values!649) e!135502)))

(assert (=> start!20740 true))

(declare-fun tp_is_empty!5251 () Bool)

(assert (=> start!20740 tp_is_empty!5251))

(declare-fun array_inv!3014 (array!9705) Bool)

(assert (=> start!20740 (array_inv!3014 _keys!825)))

(assert (=> start!20740 tp!19217))

(declare-fun b!207588 () Bool)

(declare-fun res!100800 () Bool)

(assert (=> b!207588 (=> (not res!100800) (not e!135500))))

(assert (=> b!207588 (= res!100800 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4928 _keys!825))))))

(declare-fun b!207589 () Bool)

(declare-fun res!100797 () Bool)

(assert (=> b!207589 (=> (not res!100797) (not e!135500))))

(assert (=> b!207589 (= res!100797 (= (select (arr!4603 _keys!825) i!601) k0!843))))

(declare-fun b!207590 () Bool)

(declare-fun e!135501 () Bool)

(assert (=> b!207590 (= e!135501 tp_is_empty!5251)))

(declare-fun b!207591 () Bool)

(declare-fun res!100801 () Bool)

(assert (=> b!207591 (=> (not res!100801) (not e!135500))))

(assert (=> b!207591 (= res!100801 (and (= (size!4929 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4928 _keys!825) (size!4929 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207592 () Bool)

(assert (=> b!207592 (= e!135503 tp_is_empty!5251)))

(declare-fun mapNonEmpty!8945 () Bool)

(declare-fun tp!19216 () Bool)

(assert (=> mapNonEmpty!8945 (= mapRes!8945 (and tp!19216 e!135501))))

(declare-fun mapRest!8945 () (Array (_ BitVec 32) ValueCell!2282))

(declare-fun mapKey!8945 () (_ BitVec 32))

(declare-fun mapValue!8945 () ValueCell!2282)

(assert (=> mapNonEmpty!8945 (= (arr!4604 _values!649) (store mapRest!8945 mapKey!8945 mapValue!8945))))

(assert (= (and start!20740 res!100795) b!207591))

(assert (= (and b!207591 res!100801) b!207583))

(assert (= (and b!207583 res!100799) b!207585))

(assert (= (and b!207585 res!100796) b!207588))

(assert (= (and b!207588 res!100800) b!207587))

(assert (= (and b!207587 res!100798) b!207589))

(assert (= (and b!207589 res!100797) b!207584))

(assert (= (and b!207586 condMapEmpty!8945) mapIsEmpty!8945))

(assert (= (and b!207586 (not condMapEmpty!8945)) mapNonEmpty!8945))

(get-info :version)

(assert (= (and mapNonEmpty!8945 ((_ is ValueCellFull!2282) mapValue!8945)) b!207590))

(assert (= (and b!207586 ((_ is ValueCellFull!2282) mapDefault!8945)) b!207592))

(assert (= start!20740 b!207586))

(declare-fun m!235461 () Bool)

(assert (=> b!207585 m!235461))

(declare-fun m!235463 () Bool)

(assert (=> mapNonEmpty!8945 m!235463))

(declare-fun m!235465 () Bool)

(assert (=> b!207584 m!235465))

(declare-fun m!235467 () Bool)

(assert (=> b!207584 m!235467))

(declare-fun m!235469 () Bool)

(assert (=> b!207584 m!235469))

(declare-fun m!235471 () Bool)

(assert (=> b!207584 m!235471))

(declare-fun m!235473 () Bool)

(assert (=> b!207584 m!235473))

(declare-fun m!235475 () Bool)

(assert (=> b!207584 m!235475))

(declare-fun m!235477 () Bool)

(assert (=> b!207584 m!235477))

(declare-fun m!235479 () Bool)

(assert (=> start!20740 m!235479))

(declare-fun m!235481 () Bool)

(assert (=> start!20740 m!235481))

(declare-fun m!235483 () Bool)

(assert (=> start!20740 m!235483))

(declare-fun m!235485 () Bool)

(assert (=> b!207587 m!235485))

(declare-fun m!235487 () Bool)

(assert (=> b!207583 m!235487))

(declare-fun m!235489 () Bool)

(assert (=> b!207589 m!235489))

(check-sat (not start!20740) (not mapNonEmpty!8945) b_and!12155 (not b!207587) (not b!207583) (not b_next!5395) (not b!207585) (not b!207584) tp_is_empty!5251)
(check-sat b_and!12155 (not b_next!5395))
