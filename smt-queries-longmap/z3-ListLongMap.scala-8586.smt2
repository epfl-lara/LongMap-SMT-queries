; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104748 () Bool)

(assert start!104748)

(declare-fun b_free!26553 () Bool)

(declare-fun b_next!26553 () Bool)

(assert (=> start!104748 (= b_free!26553 (not b_next!26553))))

(declare-fun tp!93149 () Bool)

(declare-fun b_and!44321 () Bool)

(assert (=> start!104748 (= tp!93149 b_and!44321)))

(declare-fun b!1248696 () Bool)

(declare-fun res!833040 () Bool)

(declare-fun e!708607 () Bool)

(assert (=> b!1248696 (=> (not res!833040) (not e!708607))))

(declare-datatypes ((array!80598 0))(
  ( (array!80599 (arr!38866 (Array (_ BitVec 32) (_ BitVec 64))) (size!39402 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80598)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80598 (_ BitVec 32)) Bool)

(assert (=> b!1248696 (= res!833040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248697 () Bool)

(declare-fun res!833043 () Bool)

(assert (=> b!1248697 (=> (not res!833043) (not e!708607))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47305 0))(
  ( (V!47306 (val!15790 Int)) )
))
(declare-datatypes ((ValueCell!14964 0))(
  ( (ValueCellFull!14964 (v!18486 V!47305)) (EmptyCell!14964) )
))
(declare-datatypes ((array!80600 0))(
  ( (array!80601 (arr!38867 (Array (_ BitVec 32) ValueCell!14964)) (size!39403 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80600)

(assert (=> b!1248697 (= res!833043 (and (= (size!39403 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39402 _keys!1118) (size!39403 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!48943 () Bool)

(declare-fun mapRes!48943 () Bool)

(declare-fun tp!93148 () Bool)

(declare-fun e!708605 () Bool)

(assert (=> mapNonEmpty!48943 (= mapRes!48943 (and tp!93148 e!708605))))

(declare-fun mapRest!48943 () (Array (_ BitVec 32) ValueCell!14964))

(declare-fun mapKey!48943 () (_ BitVec 32))

(declare-fun mapValue!48943 () ValueCell!14964)

(assert (=> mapNonEmpty!48943 (= (arr!38867 _values!914) (store mapRest!48943 mapKey!48943 mapValue!48943))))

(declare-fun b!1248698 () Bool)

(declare-fun tp_is_empty!31455 () Bool)

(assert (=> b!1248698 (= e!708605 tp_is_empty!31455)))

(declare-fun b!1248699 () Bool)

(assert (=> b!1248699 (= e!708607 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47305)

(declare-datatypes ((tuple2!20334 0))(
  ( (tuple2!20335 (_1!10178 (_ BitVec 64)) (_2!10178 V!47305)) )
))
(declare-datatypes ((List!27582 0))(
  ( (Nil!27579) (Cons!27578 (h!28787 tuple2!20334) (t!41053 List!27582)) )
))
(declare-datatypes ((ListLongMap!18207 0))(
  ( (ListLongMap!18208 (toList!9119 List!27582)) )
))
(declare-fun lt!563488 () ListLongMap!18207)

(declare-fun zeroValue!871 () V!47305)

(declare-fun getCurrentListMapNoExtraKeys!5526 (array!80598 array!80600 (_ BitVec 32) (_ BitVec 32) V!47305 V!47305 (_ BitVec 32) Int) ListLongMap!18207)

(assert (=> b!1248699 (= lt!563488 (getCurrentListMapNoExtraKeys!5526 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563487 () ListLongMap!18207)

(declare-fun minValueBefore!43 () V!47305)

(assert (=> b!1248699 (= lt!563487 (getCurrentListMapNoExtraKeys!5526 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248700 () Bool)

(declare-fun e!708603 () Bool)

(declare-fun e!708604 () Bool)

(assert (=> b!1248700 (= e!708603 (and e!708604 mapRes!48943))))

(declare-fun condMapEmpty!48943 () Bool)

(declare-fun mapDefault!48943 () ValueCell!14964)

(assert (=> b!1248700 (= condMapEmpty!48943 (= (arr!38867 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14964)) mapDefault!48943)))))

(declare-fun b!1248701 () Bool)

(declare-fun res!833041 () Bool)

(assert (=> b!1248701 (=> (not res!833041) (not e!708607))))

(declare-datatypes ((List!27583 0))(
  ( (Nil!27580) (Cons!27579 (h!28788 (_ BitVec 64)) (t!41054 List!27583)) )
))
(declare-fun arrayNoDuplicates!0 (array!80598 (_ BitVec 32) List!27583) Bool)

(assert (=> b!1248701 (= res!833041 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27580))))

(declare-fun res!833042 () Bool)

(assert (=> start!104748 (=> (not res!833042) (not e!708607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104748 (= res!833042 (validMask!0 mask!1466))))

(assert (=> start!104748 e!708607))

(assert (=> start!104748 true))

(assert (=> start!104748 tp!93149))

(assert (=> start!104748 tp_is_empty!31455))

(declare-fun array_inv!29663 (array!80598) Bool)

(assert (=> start!104748 (array_inv!29663 _keys!1118)))

(declare-fun array_inv!29664 (array!80600) Bool)

(assert (=> start!104748 (and (array_inv!29664 _values!914) e!708603)))

(declare-fun b!1248702 () Bool)

(assert (=> b!1248702 (= e!708604 tp_is_empty!31455)))

(declare-fun mapIsEmpty!48943 () Bool)

(assert (=> mapIsEmpty!48943 mapRes!48943))

(assert (= (and start!104748 res!833042) b!1248697))

(assert (= (and b!1248697 res!833043) b!1248696))

(assert (= (and b!1248696 res!833040) b!1248701))

(assert (= (and b!1248701 res!833041) b!1248699))

(assert (= (and b!1248700 condMapEmpty!48943) mapIsEmpty!48943))

(assert (= (and b!1248700 (not condMapEmpty!48943)) mapNonEmpty!48943))

(get-info :version)

(assert (= (and mapNonEmpty!48943 ((_ is ValueCellFull!14964) mapValue!48943)) b!1248698))

(assert (= (and b!1248700 ((_ is ValueCellFull!14964) mapDefault!48943)) b!1248702))

(assert (= start!104748 b!1248700))

(declare-fun m!1149783 () Bool)

(assert (=> b!1248696 m!1149783))

(declare-fun m!1149785 () Bool)

(assert (=> b!1248701 m!1149785))

(declare-fun m!1149787 () Bool)

(assert (=> b!1248699 m!1149787))

(declare-fun m!1149789 () Bool)

(assert (=> b!1248699 m!1149789))

(declare-fun m!1149791 () Bool)

(assert (=> mapNonEmpty!48943 m!1149791))

(declare-fun m!1149793 () Bool)

(assert (=> start!104748 m!1149793))

(declare-fun m!1149795 () Bool)

(assert (=> start!104748 m!1149795))

(declare-fun m!1149797 () Bool)

(assert (=> start!104748 m!1149797))

(check-sat (not b!1248701) (not start!104748) (not mapNonEmpty!48943) (not b!1248696) tp_is_empty!31455 (not b_next!26553) (not b!1248699) b_and!44321)
(check-sat b_and!44321 (not b_next!26553))
