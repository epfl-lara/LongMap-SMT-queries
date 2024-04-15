; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20350 () Bool)

(assert start!20350)

(declare-fun b_free!5005 () Bool)

(declare-fun b_next!5005 () Bool)

(assert (=> start!20350 (= b_free!5005 (not b_next!5005))))

(declare-fun tp!18047 () Bool)

(declare-fun b_and!11725 () Bool)

(assert (=> start!20350 (= tp!18047 b_and!11725)))

(declare-fun b!200571 () Bool)

(declare-fun e!131501 () Bool)

(declare-fun e!131502 () Bool)

(assert (=> b!200571 (= e!131501 (not e!131502))))

(declare-fun res!95623 () Bool)

(assert (=> b!200571 (=> res!95623 e!131502)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200571 (= res!95623 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6129 0))(
  ( (V!6130 (val!2475 Int)) )
))
(declare-datatypes ((ValueCell!2087 0))(
  ( (ValueCellFull!2087 (v!4439 V!6129)) (EmptyCell!2087) )
))
(declare-datatypes ((array!8939 0))(
  ( (array!8940 (arr!4219 (Array (_ BitVec 32) ValueCell!2087)) (size!4545 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8939)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3716 0))(
  ( (tuple2!3717 (_1!1869 (_ BitVec 64)) (_2!1869 V!6129)) )
))
(declare-datatypes ((List!2640 0))(
  ( (Nil!2637) (Cons!2636 (h!3278 tuple2!3716) (t!7562 List!2640)) )
))
(declare-datatypes ((ListLongMap!2619 0))(
  ( (ListLongMap!2620 (toList!1325 List!2640)) )
))
(declare-fun lt!99238 () ListLongMap!2619)

(declare-fun zeroValue!615 () V!6129)

(declare-datatypes ((array!8941 0))(
  ( (array!8942 (arr!4220 (Array (_ BitVec 32) (_ BitVec 64))) (size!4546 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8941)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6129)

(declare-fun getCurrentListMap!893 (array!8941 array!8939 (_ BitVec 32) (_ BitVec 32) V!6129 V!6129 (_ BitVec 32) Int) ListLongMap!2619)

(assert (=> b!200571 (= lt!99238 (getCurrentListMap!893 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99235 () ListLongMap!2619)

(declare-fun lt!99229 () array!8939)

(assert (=> b!200571 (= lt!99235 (getCurrentListMap!893 _keys!825 lt!99229 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99233 () ListLongMap!2619)

(declare-fun lt!99236 () ListLongMap!2619)

(assert (=> b!200571 (and (= lt!99233 lt!99236) (= lt!99236 lt!99233))))

(declare-fun lt!99232 () ListLongMap!2619)

(declare-fun lt!99241 () tuple2!3716)

(declare-fun +!374 (ListLongMap!2619 tuple2!3716) ListLongMap!2619)

(assert (=> b!200571 (= lt!99236 (+!374 lt!99232 lt!99241))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6129)

(assert (=> b!200571 (= lt!99241 (tuple2!3717 k0!843 v!520))))

(declare-datatypes ((Unit!6000 0))(
  ( (Unit!6001) )
))
(declare-fun lt!99240 () Unit!6000)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!52 (array!8941 array!8939 (_ BitVec 32) (_ BitVec 32) V!6129 V!6129 (_ BitVec 32) (_ BitVec 64) V!6129 (_ BitVec 32) Int) Unit!6000)

(assert (=> b!200571 (= lt!99240 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!52 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!303 (array!8941 array!8939 (_ BitVec 32) (_ BitVec 32) V!6129 V!6129 (_ BitVec 32) Int) ListLongMap!2619)

(assert (=> b!200571 (= lt!99233 (getCurrentListMapNoExtraKeys!303 _keys!825 lt!99229 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200571 (= lt!99229 (array!8940 (store (arr!4219 _values!649) i!601 (ValueCellFull!2087 v!520)) (size!4545 _values!649)))))

(assert (=> b!200571 (= lt!99232 (getCurrentListMapNoExtraKeys!303 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200572 () Bool)

(declare-fun e!131499 () Bool)

(declare-fun tp_is_empty!4861 () Bool)

(assert (=> b!200572 (= e!131499 tp_is_empty!4861)))

(declare-fun res!95620 () Bool)

(assert (=> start!20350 (=> (not res!95620) (not e!131501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20350 (= res!95620 (validMask!0 mask!1149))))

(assert (=> start!20350 e!131501))

(declare-fun e!131504 () Bool)

(declare-fun array_inv!2753 (array!8939) Bool)

(assert (=> start!20350 (and (array_inv!2753 _values!649) e!131504)))

(assert (=> start!20350 true))

(assert (=> start!20350 tp_is_empty!4861))

(declare-fun array_inv!2754 (array!8941) Bool)

(assert (=> start!20350 (array_inv!2754 _keys!825)))

(assert (=> start!20350 tp!18047))

(declare-fun b!200573 () Bool)

(declare-fun res!95622 () Bool)

(assert (=> b!200573 (=> (not res!95622) (not e!131501))))

(declare-datatypes ((List!2641 0))(
  ( (Nil!2638) (Cons!2637 (h!3279 (_ BitVec 64)) (t!7563 List!2641)) )
))
(declare-fun arrayNoDuplicates!0 (array!8941 (_ BitVec 32) List!2641) Bool)

(assert (=> b!200573 (= res!95622 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2638))))

(declare-fun b!200574 () Bool)

(declare-fun res!95617 () Bool)

(assert (=> b!200574 (=> (not res!95617) (not e!131501))))

(assert (=> b!200574 (= res!95617 (= (select (arr!4220 _keys!825) i!601) k0!843))))

(declare-fun b!200575 () Bool)

(declare-fun res!95618 () Bool)

(assert (=> b!200575 (=> (not res!95618) (not e!131501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8941 (_ BitVec 32)) Bool)

(assert (=> b!200575 (= res!95618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8360 () Bool)

(declare-fun mapRes!8360 () Bool)

(declare-fun tp!18046 () Bool)

(assert (=> mapNonEmpty!8360 (= mapRes!8360 (and tp!18046 e!131499))))

(declare-fun mapValue!8360 () ValueCell!2087)

(declare-fun mapRest!8360 () (Array (_ BitVec 32) ValueCell!2087))

(declare-fun mapKey!8360 () (_ BitVec 32))

(assert (=> mapNonEmpty!8360 (= (arr!4219 _values!649) (store mapRest!8360 mapKey!8360 mapValue!8360))))

(declare-fun mapIsEmpty!8360 () Bool)

(assert (=> mapIsEmpty!8360 mapRes!8360))

(declare-fun b!200576 () Bool)

(declare-fun res!95619 () Bool)

(assert (=> b!200576 (=> (not res!95619) (not e!131501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200576 (= res!95619 (validKeyInArray!0 k0!843))))

(declare-fun b!200577 () Bool)

(declare-fun res!95624 () Bool)

(assert (=> b!200577 (=> (not res!95624) (not e!131501))))

(assert (=> b!200577 (= res!95624 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4546 _keys!825))))))

(declare-fun b!200578 () Bool)

(declare-fun e!131500 () Bool)

(assert (=> b!200578 (= e!131502 e!131500)))

(declare-fun res!95621 () Bool)

(assert (=> b!200578 (=> res!95621 e!131500)))

(assert (=> b!200578 (= res!95621 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99234 () ListLongMap!2619)

(declare-fun lt!99228 () ListLongMap!2619)

(assert (=> b!200578 (= lt!99234 lt!99228)))

(declare-fun lt!99239 () ListLongMap!2619)

(assert (=> b!200578 (= lt!99228 (+!374 lt!99239 lt!99241))))

(declare-fun lt!99227 () Unit!6000)

(declare-fun addCommutativeForDiffKeys!83 (ListLongMap!2619 (_ BitVec 64) V!6129 (_ BitVec 64) V!6129) Unit!6000)

(assert (=> b!200578 (= lt!99227 (addCommutativeForDiffKeys!83 lt!99232 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99242 () tuple2!3716)

(assert (=> b!200578 (= lt!99235 (+!374 lt!99234 lt!99242))))

(declare-fun lt!99230 () tuple2!3716)

(assert (=> b!200578 (= lt!99234 (+!374 lt!99236 lt!99230))))

(declare-fun lt!99231 () ListLongMap!2619)

(assert (=> b!200578 (= lt!99238 lt!99231)))

(assert (=> b!200578 (= lt!99231 (+!374 lt!99239 lt!99242))))

(assert (=> b!200578 (= lt!99239 (+!374 lt!99232 lt!99230))))

(assert (=> b!200578 (= lt!99235 (+!374 (+!374 lt!99233 lt!99230) lt!99242))))

(assert (=> b!200578 (= lt!99242 (tuple2!3717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200578 (= lt!99230 (tuple2!3717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200579 () Bool)

(assert (=> b!200579 (= e!131500 true)))

(assert (=> b!200579 (= (+!374 lt!99228 lt!99242) (+!374 lt!99231 lt!99241))))

(declare-fun lt!99237 () Unit!6000)

(assert (=> b!200579 (= lt!99237 (addCommutativeForDiffKeys!83 lt!99239 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200580 () Bool)

(declare-fun e!131503 () Bool)

(assert (=> b!200580 (= e!131504 (and e!131503 mapRes!8360))))

(declare-fun condMapEmpty!8360 () Bool)

(declare-fun mapDefault!8360 () ValueCell!2087)

(assert (=> b!200580 (= condMapEmpty!8360 (= (arr!4219 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2087)) mapDefault!8360)))))

(declare-fun b!200581 () Bool)

(assert (=> b!200581 (= e!131503 tp_is_empty!4861)))

(declare-fun b!200582 () Bool)

(declare-fun res!95616 () Bool)

(assert (=> b!200582 (=> (not res!95616) (not e!131501))))

(assert (=> b!200582 (= res!95616 (and (= (size!4545 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4546 _keys!825) (size!4545 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20350 res!95620) b!200582))

(assert (= (and b!200582 res!95616) b!200575))

(assert (= (and b!200575 res!95618) b!200573))

(assert (= (and b!200573 res!95622) b!200577))

(assert (= (and b!200577 res!95624) b!200576))

(assert (= (and b!200576 res!95619) b!200574))

(assert (= (and b!200574 res!95617) b!200571))

(assert (= (and b!200571 (not res!95623)) b!200578))

(assert (= (and b!200578 (not res!95621)) b!200579))

(assert (= (and b!200580 condMapEmpty!8360) mapIsEmpty!8360))

(assert (= (and b!200580 (not condMapEmpty!8360)) mapNonEmpty!8360))

(get-info :version)

(assert (= (and mapNonEmpty!8360 ((_ is ValueCellFull!2087) mapValue!8360)) b!200572))

(assert (= (and b!200580 ((_ is ValueCellFull!2087) mapDefault!8360)) b!200581))

(assert (= start!20350 b!200580))

(declare-fun m!226707 () Bool)

(assert (=> b!200571 m!226707))

(declare-fun m!226709 () Bool)

(assert (=> b!200571 m!226709))

(declare-fun m!226711 () Bool)

(assert (=> b!200571 m!226711))

(declare-fun m!226713 () Bool)

(assert (=> b!200571 m!226713))

(declare-fun m!226715 () Bool)

(assert (=> b!200571 m!226715))

(declare-fun m!226717 () Bool)

(assert (=> b!200571 m!226717))

(declare-fun m!226719 () Bool)

(assert (=> b!200571 m!226719))

(declare-fun m!226721 () Bool)

(assert (=> start!20350 m!226721))

(declare-fun m!226723 () Bool)

(assert (=> start!20350 m!226723))

(declare-fun m!226725 () Bool)

(assert (=> start!20350 m!226725))

(declare-fun m!226727 () Bool)

(assert (=> mapNonEmpty!8360 m!226727))

(declare-fun m!226729 () Bool)

(assert (=> b!200575 m!226729))

(declare-fun m!226731 () Bool)

(assert (=> b!200578 m!226731))

(declare-fun m!226733 () Bool)

(assert (=> b!200578 m!226733))

(declare-fun m!226735 () Bool)

(assert (=> b!200578 m!226735))

(declare-fun m!226737 () Bool)

(assert (=> b!200578 m!226737))

(declare-fun m!226739 () Bool)

(assert (=> b!200578 m!226739))

(declare-fun m!226741 () Bool)

(assert (=> b!200578 m!226741))

(assert (=> b!200578 m!226735))

(declare-fun m!226743 () Bool)

(assert (=> b!200578 m!226743))

(declare-fun m!226745 () Bool)

(assert (=> b!200578 m!226745))

(declare-fun m!226747 () Bool)

(assert (=> b!200579 m!226747))

(declare-fun m!226749 () Bool)

(assert (=> b!200579 m!226749))

(declare-fun m!226751 () Bool)

(assert (=> b!200579 m!226751))

(declare-fun m!226753 () Bool)

(assert (=> b!200574 m!226753))

(declare-fun m!226755 () Bool)

(assert (=> b!200573 m!226755))

(declare-fun m!226757 () Bool)

(assert (=> b!200576 m!226757))

(check-sat (not b!200573) (not b!200578) (not b!200575) (not b!200579) (not b!200576) b_and!11725 tp_is_empty!4861 (not b!200571) (not b_next!5005) (not mapNonEmpty!8360) (not start!20350))
(check-sat b_and!11725 (not b_next!5005))
