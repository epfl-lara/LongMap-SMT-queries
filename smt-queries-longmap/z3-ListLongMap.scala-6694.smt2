; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84138 () Bool)

(assert start!84138)

(declare-fun b!983749 () Bool)

(declare-fun e!554607 () Bool)

(declare-fun tp_is_empty!22941 () Bool)

(assert (=> b!983749 (= e!554607 tp_is_empty!22941)))

(declare-fun b!983750 () Bool)

(declare-fun res!658260 () Bool)

(declare-fun e!554610 () Bool)

(assert (=> b!983750 (=> (not res!658260) (not e!554610))))

(declare-datatypes ((array!61865 0))(
  ( (array!61866 (arr!29790 (Array (_ BitVec 32) (_ BitVec 64))) (size!30269 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61865)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61865 (_ BitVec 32)) Bool)

(assert (=> b!983750 (= res!658260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983751 () Bool)

(declare-fun e!554608 () Bool)

(assert (=> b!983751 (= e!554608 tp_is_empty!22941)))

(declare-fun mapIsEmpty!36440 () Bool)

(declare-fun mapRes!36440 () Bool)

(assert (=> mapIsEmpty!36440 mapRes!36440))

(declare-fun b!983752 () Bool)

(declare-fun res!658262 () Bool)

(assert (=> b!983752 (=> (not res!658262) (not e!554610))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983752 (= res!658262 (validKeyInArray!0 (select (arr!29790 _keys!1544) from!1932)))))

(declare-fun b!983753 () Bool)

(declare-fun e!554606 () Bool)

(assert (=> b!983753 (= e!554606 (and e!554608 mapRes!36440))))

(declare-fun condMapEmpty!36440 () Bool)

(declare-datatypes ((V!35571 0))(
  ( (V!35572 (val!11521 Int)) )
))
(declare-datatypes ((ValueCell!10989 0))(
  ( (ValueCellFull!10989 (v!14083 V!35571)) (EmptyCell!10989) )
))
(declare-datatypes ((array!61867 0))(
  ( (array!61868 (arr!29791 (Array (_ BitVec 32) ValueCell!10989)) (size!30270 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61867)

(declare-fun mapDefault!36440 () ValueCell!10989)

(assert (=> b!983753 (= condMapEmpty!36440 (= (arr!29791 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10989)) mapDefault!36440)))))

(declare-fun b!983754 () Bool)

(declare-fun res!658261 () Bool)

(assert (=> b!983754 (=> (not res!658261) (not e!554610))))

(declare-datatypes ((List!20624 0))(
  ( (Nil!20621) (Cons!20620 (h!21782 (_ BitVec 64)) (t!29415 List!20624)) )
))
(declare-fun arrayNoDuplicates!0 (array!61865 (_ BitVec 32) List!20624) Bool)

(assert (=> b!983754 (= res!658261 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20621))))

(declare-fun mapNonEmpty!36440 () Bool)

(declare-fun tp!69124 () Bool)

(assert (=> mapNonEmpty!36440 (= mapRes!36440 (and tp!69124 e!554607))))

(declare-fun mapValue!36440 () ValueCell!10989)

(declare-fun mapRest!36440 () (Array (_ BitVec 32) ValueCell!10989))

(declare-fun mapKey!36440 () (_ BitVec 32))

(assert (=> mapNonEmpty!36440 (= (arr!29791 _values!1278) (store mapRest!36440 mapKey!36440 mapValue!36440))))

(declare-fun b!983755 () Bool)

(declare-fun res!658257 () Bool)

(assert (=> b!983755 (=> (not res!658257) (not e!554610))))

(assert (=> b!983755 (= res!658257 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30269 _keys!1544))))))

(declare-fun b!983756 () Bool)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983756 (= e!554610 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun res!658258 () Bool)

(assert (=> start!84138 (=> (not res!658258) (not e!554610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84138 (= res!658258 (validMask!0 mask!1948))))

(assert (=> start!84138 e!554610))

(assert (=> start!84138 true))

(declare-fun array_inv!23035 (array!61867) Bool)

(assert (=> start!84138 (and (array_inv!23035 _values!1278) e!554606)))

(declare-fun array_inv!23036 (array!61865) Bool)

(assert (=> start!84138 (array_inv!23036 _keys!1544)))

(declare-fun b!983757 () Bool)

(declare-fun res!658259 () Bool)

(assert (=> b!983757 (=> (not res!658259) (not e!554610))))

(assert (=> b!983757 (= res!658259 (and (= (size!30270 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30269 _keys!1544) (size!30270 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84138 res!658258) b!983757))

(assert (= (and b!983757 res!658259) b!983750))

(assert (= (and b!983750 res!658260) b!983754))

(assert (= (and b!983754 res!658261) b!983755))

(assert (= (and b!983755 res!658257) b!983752))

(assert (= (and b!983752 res!658262) b!983756))

(assert (= (and b!983753 condMapEmpty!36440) mapIsEmpty!36440))

(assert (= (and b!983753 (not condMapEmpty!36440)) mapNonEmpty!36440))

(get-info :version)

(assert (= (and mapNonEmpty!36440 ((_ is ValueCellFull!10989) mapValue!36440)) b!983749))

(assert (= (and b!983753 ((_ is ValueCellFull!10989) mapDefault!36440)) b!983751))

(assert (= start!84138 b!983753))

(declare-fun m!910913 () Bool)

(assert (=> start!84138 m!910913))

(declare-fun m!910915 () Bool)

(assert (=> start!84138 m!910915))

(declare-fun m!910917 () Bool)

(assert (=> start!84138 m!910917))

(declare-fun m!910919 () Bool)

(assert (=> b!983754 m!910919))

(declare-fun m!910921 () Bool)

(assert (=> mapNonEmpty!36440 m!910921))

(declare-fun m!910923 () Bool)

(assert (=> b!983752 m!910923))

(assert (=> b!983752 m!910923))

(declare-fun m!910925 () Bool)

(assert (=> b!983752 m!910925))

(declare-fun m!910927 () Bool)

(assert (=> b!983750 m!910927))

(check-sat (not b!983754) (not b!983752) tp_is_empty!22941 (not b!983750) (not start!84138) (not mapNonEmpty!36440))
(check-sat)
