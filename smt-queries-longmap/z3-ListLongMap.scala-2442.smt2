; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38456 () Bool)

(assert start!38456)

(declare-fun b!397012 () Bool)

(declare-fun res!227908 () Bool)

(declare-fun e!240153 () Bool)

(assert (=> b!397012 (=> (not res!227908) (not e!240153))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23680 0))(
  ( (array!23681 (arr!11289 (Array (_ BitVec 32) (_ BitVec 64))) (size!11641 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23680)

(assert (=> b!397012 (= res!227908 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11641 _keys!709))))))

(declare-fun b!397013 () Bool)

(declare-fun e!240154 () Bool)

(declare-fun e!240150 () Bool)

(declare-fun mapRes!16455 () Bool)

(assert (=> b!397013 (= e!240154 (and e!240150 mapRes!16455))))

(declare-fun condMapEmpty!16455 () Bool)

(declare-datatypes ((V!14291 0))(
  ( (V!14292 (val!4989 Int)) )
))
(declare-datatypes ((ValueCell!4601 0))(
  ( (ValueCellFull!4601 (v!7237 V!14291)) (EmptyCell!4601) )
))
(declare-datatypes ((array!23682 0))(
  ( (array!23683 (arr!11290 (Array (_ BitVec 32) ValueCell!4601)) (size!11642 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23682)

(declare-fun mapDefault!16455 () ValueCell!4601)

(assert (=> b!397013 (= condMapEmpty!16455 (= (arr!11290 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4601)) mapDefault!16455)))))

(declare-fun b!397014 () Bool)

(declare-fun e!240149 () Bool)

(declare-fun tp_is_empty!9889 () Bool)

(assert (=> b!397014 (= e!240149 tp_is_empty!9889)))

(declare-fun b!397015 () Bool)

(declare-fun res!227907 () Bool)

(assert (=> b!397015 (=> (not res!227907) (not e!240153))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397015 (= res!227907 (validMask!0 mask!1025))))

(declare-fun b!397016 () Bool)

(assert (=> b!397016 (= e!240150 tp_is_empty!9889)))

(declare-fun b!397017 () Bool)

(declare-fun res!227912 () Bool)

(assert (=> b!397017 (=> (not res!227912) (not e!240153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23680 (_ BitVec 32)) Bool)

(assert (=> b!397017 (= res!227912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16455 () Bool)

(assert (=> mapIsEmpty!16455 mapRes!16455))

(declare-fun mapNonEmpty!16455 () Bool)

(declare-fun tp!32250 () Bool)

(assert (=> mapNonEmpty!16455 (= mapRes!16455 (and tp!32250 e!240149))))

(declare-fun mapKey!16455 () (_ BitVec 32))

(declare-fun mapValue!16455 () ValueCell!4601)

(declare-fun mapRest!16455 () (Array (_ BitVec 32) ValueCell!4601))

(assert (=> mapNonEmpty!16455 (= (arr!11290 _values!549) (store mapRest!16455 mapKey!16455 mapValue!16455))))

(declare-fun b!397018 () Bool)

(declare-fun res!227915 () Bool)

(assert (=> b!397018 (=> (not res!227915) (not e!240153))))

(declare-datatypes ((List!6406 0))(
  ( (Nil!6403) (Cons!6402 (h!7258 (_ BitVec 64)) (t!11572 List!6406)) )
))
(declare-fun arrayNoDuplicates!0 (array!23680 (_ BitVec 32) List!6406) Bool)

(assert (=> b!397018 (= res!227915 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6403))))

(declare-fun b!397019 () Bool)

(declare-fun res!227911 () Bool)

(assert (=> b!397019 (=> (not res!227911) (not e!240153))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397019 (= res!227911 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397020 () Bool)

(declare-fun res!227916 () Bool)

(assert (=> b!397020 (=> (not res!227916) (not e!240153))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397020 (= res!227916 (and (= (size!11642 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11641 _keys!709) (size!11642 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!227914 () Bool)

(assert (=> start!38456 (=> (not res!227914) (not e!240153))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38456 (= res!227914 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11641 _keys!709))))))

(assert (=> start!38456 e!240153))

(assert (=> start!38456 true))

(declare-fun array_inv!8342 (array!23682) Bool)

(assert (=> start!38456 (and (array_inv!8342 _values!549) e!240154)))

(declare-fun array_inv!8343 (array!23680) Bool)

(assert (=> start!38456 (array_inv!8343 _keys!709)))

(declare-fun b!397021 () Bool)

(declare-fun e!240152 () Bool)

(assert (=> b!397021 (= e!240153 e!240152)))

(declare-fun res!227909 () Bool)

(assert (=> b!397021 (=> (not res!227909) (not e!240152))))

(declare-fun lt!187266 () array!23680)

(assert (=> b!397021 (= res!227909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187266 mask!1025))))

(assert (=> b!397021 (= lt!187266 (array!23681 (store (arr!11289 _keys!709) i!563 k0!794) (size!11641 _keys!709)))))

(declare-fun b!397022 () Bool)

(declare-fun res!227910 () Bool)

(assert (=> b!397022 (=> (not res!227910) (not e!240153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397022 (= res!227910 (validKeyInArray!0 k0!794))))

(declare-fun b!397023 () Bool)

(assert (=> b!397023 (= e!240152 false)))

(declare-fun lt!187265 () Bool)

(assert (=> b!397023 (= lt!187265 (arrayNoDuplicates!0 lt!187266 #b00000000000000000000000000000000 Nil!6403))))

(declare-fun b!397024 () Bool)

(declare-fun res!227913 () Bool)

(assert (=> b!397024 (=> (not res!227913) (not e!240153))))

(assert (=> b!397024 (= res!227913 (or (= (select (arr!11289 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11289 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38456 res!227914) b!397015))

(assert (= (and b!397015 res!227907) b!397020))

(assert (= (and b!397020 res!227916) b!397017))

(assert (= (and b!397017 res!227912) b!397018))

(assert (= (and b!397018 res!227915) b!397012))

(assert (= (and b!397012 res!227908) b!397022))

(assert (= (and b!397022 res!227910) b!397024))

(assert (= (and b!397024 res!227913) b!397019))

(assert (= (and b!397019 res!227911) b!397021))

(assert (= (and b!397021 res!227909) b!397023))

(assert (= (and b!397013 condMapEmpty!16455) mapIsEmpty!16455))

(assert (= (and b!397013 (not condMapEmpty!16455)) mapNonEmpty!16455))

(get-info :version)

(assert (= (and mapNonEmpty!16455 ((_ is ValueCellFull!4601) mapValue!16455)) b!397014))

(assert (= (and b!397013 ((_ is ValueCellFull!4601) mapDefault!16455)) b!397016))

(assert (= start!38456 b!397013))

(declare-fun m!392685 () Bool)

(assert (=> b!397022 m!392685))

(declare-fun m!392687 () Bool)

(assert (=> b!397019 m!392687))

(declare-fun m!392689 () Bool)

(assert (=> mapNonEmpty!16455 m!392689))

(declare-fun m!392691 () Bool)

(assert (=> b!397021 m!392691))

(declare-fun m!392693 () Bool)

(assert (=> b!397021 m!392693))

(declare-fun m!392695 () Bool)

(assert (=> b!397024 m!392695))

(declare-fun m!392697 () Bool)

(assert (=> b!397017 m!392697))

(declare-fun m!392699 () Bool)

(assert (=> b!397015 m!392699))

(declare-fun m!392701 () Bool)

(assert (=> start!38456 m!392701))

(declare-fun m!392703 () Bool)

(assert (=> start!38456 m!392703))

(declare-fun m!392705 () Bool)

(assert (=> b!397018 m!392705))

(declare-fun m!392707 () Bool)

(assert (=> b!397023 m!392707))

(check-sat (not b!397021) (not b!397023) (not b!397022) (not b!397019) (not mapNonEmpty!16455) tp_is_empty!9889 (not b!397015) (not b!397017) (not start!38456) (not b!397018))
(check-sat)
