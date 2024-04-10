; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104648 () Bool)

(assert start!104648)

(declare-fun b!1247773 () Bool)

(declare-fun res!832534 () Bool)

(declare-fun e!707947 () Bool)

(assert (=> b!1247773 (=> (not res!832534) (not e!707947))))

(declare-datatypes ((array!80446 0))(
  ( (array!80447 (arr!38792 (Array (_ BitVec 32) (_ BitVec 64))) (size!39328 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80446)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80446 (_ BitVec 32)) Bool)

(assert (=> b!1247773 (= res!832534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247774 () Bool)

(assert (=> b!1247774 (= e!707947 false)))

(declare-fun lt!563317 () Bool)

(declare-datatypes ((List!27538 0))(
  ( (Nil!27535) (Cons!27534 (h!28743 (_ BitVec 64)) (t!41007 List!27538)) )
))
(declare-fun arrayNoDuplicates!0 (array!80446 (_ BitVec 32) List!27538) Bool)

(assert (=> b!1247774 (= lt!563317 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27535))))

(declare-fun mapIsEmpty!48820 () Bool)

(declare-fun mapRes!48820 () Bool)

(assert (=> mapIsEmpty!48820 mapRes!48820))

(declare-fun b!1247775 () Bool)

(declare-fun e!707944 () Bool)

(declare-fun tp_is_empty!31377 () Bool)

(assert (=> b!1247775 (= e!707944 tp_is_empty!31377)))

(declare-fun b!1247776 () Bool)

(declare-fun res!832536 () Bool)

(assert (=> b!1247776 (=> (not res!832536) (not e!707947))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47201 0))(
  ( (V!47202 (val!15751 Int)) )
))
(declare-datatypes ((ValueCell!14925 0))(
  ( (ValueCellFull!14925 (v!18447 V!47201)) (EmptyCell!14925) )
))
(declare-datatypes ((array!80448 0))(
  ( (array!80449 (arr!38793 (Array (_ BitVec 32) ValueCell!14925)) (size!39329 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80448)

(assert (=> b!1247776 (= res!832536 (and (= (size!39329 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39328 _keys!1118) (size!39329 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!48820 () Bool)

(declare-fun tp!92921 () Bool)

(declare-fun e!707943 () Bool)

(assert (=> mapNonEmpty!48820 (= mapRes!48820 (and tp!92921 e!707943))))

(declare-fun mapRest!48820 () (Array (_ BitVec 32) ValueCell!14925))

(declare-fun mapKey!48820 () (_ BitVec 32))

(declare-fun mapValue!48820 () ValueCell!14925)

(assert (=> mapNonEmpty!48820 (= (arr!38793 _values!914) (store mapRest!48820 mapKey!48820 mapValue!48820))))

(declare-fun b!1247778 () Bool)

(assert (=> b!1247778 (= e!707943 tp_is_empty!31377)))

(declare-fun b!1247777 () Bool)

(declare-fun e!707946 () Bool)

(assert (=> b!1247777 (= e!707946 (and e!707944 mapRes!48820))))

(declare-fun condMapEmpty!48820 () Bool)

(declare-fun mapDefault!48820 () ValueCell!14925)

(assert (=> b!1247777 (= condMapEmpty!48820 (= (arr!38793 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14925)) mapDefault!48820)))))

(declare-fun res!832535 () Bool)

(assert (=> start!104648 (=> (not res!832535) (not e!707947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104648 (= res!832535 (validMask!0 mask!1466))))

(assert (=> start!104648 e!707947))

(assert (=> start!104648 true))

(declare-fun array_inv!29617 (array!80446) Bool)

(assert (=> start!104648 (array_inv!29617 _keys!1118)))

(declare-fun array_inv!29618 (array!80448) Bool)

(assert (=> start!104648 (and (array_inv!29618 _values!914) e!707946)))

(assert (= (and start!104648 res!832535) b!1247776))

(assert (= (and b!1247776 res!832536) b!1247773))

(assert (= (and b!1247773 res!832534) b!1247774))

(assert (= (and b!1247777 condMapEmpty!48820) mapIsEmpty!48820))

(assert (= (and b!1247777 (not condMapEmpty!48820)) mapNonEmpty!48820))

(get-info :version)

(assert (= (and mapNonEmpty!48820 ((_ is ValueCellFull!14925) mapValue!48820)) b!1247778))

(assert (= (and b!1247777 ((_ is ValueCellFull!14925) mapDefault!48820)) b!1247775))

(assert (= start!104648 b!1247777))

(declare-fun m!1149171 () Bool)

(assert (=> b!1247773 m!1149171))

(declare-fun m!1149173 () Bool)

(assert (=> b!1247774 m!1149173))

(declare-fun m!1149175 () Bool)

(assert (=> mapNonEmpty!48820 m!1149175))

(declare-fun m!1149177 () Bool)

(assert (=> start!104648 m!1149177))

(declare-fun m!1149179 () Bool)

(assert (=> start!104648 m!1149179))

(declare-fun m!1149181 () Bool)

(assert (=> start!104648 m!1149181))

(check-sat tp_is_empty!31377 (not b!1247773) (not b!1247774) (not mapNonEmpty!48820) (not start!104648))
(check-sat)
