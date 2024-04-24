; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133922 () Bool)

(assert start!133922)

(declare-fun mapNonEmpty!59265 () Bool)

(declare-fun mapRes!59265 () Bool)

(declare-fun tp!112920 () Bool)

(declare-fun e!871286 () Bool)

(assert (=> mapNonEmpty!59265 (= mapRes!59265 (and tp!112920 e!871286))))

(declare-datatypes ((V!59665 0))(
  ( (V!59666 (val!19380 Int)) )
))
(declare-datatypes ((ValueCell!18266 0))(
  ( (ValueCellFull!18266 (v!22124 V!59665)) (EmptyCell!18266) )
))
(declare-fun mapRest!59265 () (Array (_ BitVec 32) ValueCell!18266))

(declare-fun mapValue!59265 () ValueCell!18266)

(declare-fun mapKey!59265 () (_ BitVec 32))

(declare-datatypes ((array!104022 0))(
  ( (array!104023 (arr!50196 (Array (_ BitVec 32) ValueCell!18266)) (size!50747 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104022)

(assert (=> mapNonEmpty!59265 (= (arr!50196 _values!487) (store mapRest!59265 mapKey!59265 mapValue!59265))))

(declare-fun b!1563192 () Bool)

(declare-fun tp_is_empty!38593 () Bool)

(assert (=> b!1563192 (= e!871286 tp_is_empty!38593)))

(declare-fun b!1563193 () Bool)

(declare-fun res!1068059 () Bool)

(declare-fun e!871285 () Bool)

(assert (=> b!1563193 (=> (not res!1068059) (not e!871285))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104024 0))(
  ( (array!104025 (arr!50197 (Array (_ BitVec 32) (_ BitVec 64))) (size!50748 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104024)

(assert (=> b!1563193 (= res!1068059 (and (= (size!50747 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50748 _keys!637) (size!50747 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1068058 () Bool)

(assert (=> start!133922 (=> (not res!1068058) (not e!871285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133922 (= res!1068058 (validMask!0 mask!947))))

(assert (=> start!133922 e!871285))

(assert (=> start!133922 true))

(declare-fun e!871287 () Bool)

(declare-fun array_inv!39267 (array!104022) Bool)

(assert (=> start!133922 (and (array_inv!39267 _values!487) e!871287)))

(declare-fun array_inv!39268 (array!104024) Bool)

(assert (=> start!133922 (array_inv!39268 _keys!637)))

(declare-fun b!1563194 () Bool)

(declare-fun res!1068057 () Bool)

(assert (=> b!1563194 (=> (not res!1068057) (not e!871285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104024 (_ BitVec 32)) Bool)

(assert (=> b!1563194 (= res!1068057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59265 () Bool)

(assert (=> mapIsEmpty!59265 mapRes!59265))

(declare-fun b!1563195 () Bool)

(assert (=> b!1563195 (= e!871285 false)))

(declare-fun lt!671954 () Bool)

(declare-datatypes ((List!36433 0))(
  ( (Nil!36430) (Cons!36429 (h!37893 (_ BitVec 64)) (t!51158 List!36433)) )
))
(declare-fun arrayNoDuplicates!0 (array!104024 (_ BitVec 32) List!36433) Bool)

(assert (=> b!1563195 (= lt!671954 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36430))))

(declare-fun b!1563196 () Bool)

(declare-fun e!871284 () Bool)

(assert (=> b!1563196 (= e!871287 (and e!871284 mapRes!59265))))

(declare-fun condMapEmpty!59265 () Bool)

(declare-fun mapDefault!59265 () ValueCell!18266)

(assert (=> b!1563196 (= condMapEmpty!59265 (= (arr!50196 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18266)) mapDefault!59265)))))

(declare-fun b!1563197 () Bool)

(assert (=> b!1563197 (= e!871284 tp_is_empty!38593)))

(assert (= (and start!133922 res!1068058) b!1563193))

(assert (= (and b!1563193 res!1068059) b!1563194))

(assert (= (and b!1563194 res!1068057) b!1563195))

(assert (= (and b!1563196 condMapEmpty!59265) mapIsEmpty!59265))

(assert (= (and b!1563196 (not condMapEmpty!59265)) mapNonEmpty!59265))

(get-info :version)

(assert (= (and mapNonEmpty!59265 ((_ is ValueCellFull!18266) mapValue!59265)) b!1563192))

(assert (= (and b!1563196 ((_ is ValueCellFull!18266) mapDefault!59265)) b!1563197))

(assert (= start!133922 b!1563196))

(declare-fun m!1438755 () Bool)

(assert (=> mapNonEmpty!59265 m!1438755))

(declare-fun m!1438757 () Bool)

(assert (=> start!133922 m!1438757))

(declare-fun m!1438759 () Bool)

(assert (=> start!133922 m!1438759))

(declare-fun m!1438761 () Bool)

(assert (=> start!133922 m!1438761))

(declare-fun m!1438763 () Bool)

(assert (=> b!1563194 m!1438763))

(declare-fun m!1438765 () Bool)

(assert (=> b!1563195 m!1438765))

(check-sat tp_is_empty!38593 (not start!133922) (not b!1563194) (not mapNonEmpty!59265) (not b!1563195))
(check-sat)
