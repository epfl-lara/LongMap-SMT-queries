; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100134 () Bool)

(assert start!100134)

(declare-fun b!1194166 () Bool)

(declare-fun res!794523 () Bool)

(declare-fun e!678673 () Bool)

(assert (=> b!1194166 (=> (not res!794523) (not e!678673))))

(declare-datatypes ((array!77265 0))(
  ( (array!77266 (arr!37282 (Array (_ BitVec 32) (_ BitVec 64))) (size!37818 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77265)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1194166 (= res!794523 (= (select (arr!37282 _keys!1208) i!673) k0!934))))

(declare-fun b!1194167 () Bool)

(declare-fun e!678668 () Bool)

(assert (=> b!1194167 (= e!678673 e!678668)))

(declare-fun res!794526 () Bool)

(assert (=> b!1194167 (=> (not res!794526) (not e!678668))))

(declare-fun lt!542732 () array!77265)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77265 (_ BitVec 32)) Bool)

(assert (=> b!1194167 (= res!794526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542732 mask!1564))))

(assert (=> b!1194167 (= lt!542732 (array!77266 (store (arr!37282 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37818 _keys!1208)))))

(declare-fun b!1194169 () Bool)

(declare-fun res!794524 () Bool)

(assert (=> b!1194169 (=> (not res!794524) (not e!678673))))

(assert (=> b!1194169 (= res!794524 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37818 _keys!1208))))))

(declare-fun b!1194170 () Bool)

(declare-fun e!678670 () Bool)

(declare-fun tp_is_empty!30243 () Bool)

(assert (=> b!1194170 (= e!678670 tp_is_empty!30243)))

(declare-fun b!1194171 () Bool)

(declare-fun e!678672 () Bool)

(assert (=> b!1194171 (= e!678672 tp_is_empty!30243)))

(declare-fun b!1194172 () Bool)

(declare-fun e!678671 () Bool)

(declare-fun mapRes!47192 () Bool)

(assert (=> b!1194172 (= e!678671 (and e!678670 mapRes!47192))))

(declare-fun condMapEmpty!47192 () Bool)

(declare-datatypes ((V!45451 0))(
  ( (V!45452 (val!15178 Int)) )
))
(declare-datatypes ((ValueCell!14412 0))(
  ( (ValueCellFull!14412 (v!17816 V!45451)) (EmptyCell!14412) )
))
(declare-datatypes ((array!77267 0))(
  ( (array!77268 (arr!37283 (Array (_ BitVec 32) ValueCell!14412)) (size!37819 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77267)

(declare-fun mapDefault!47192 () ValueCell!14412)

(assert (=> b!1194172 (= condMapEmpty!47192 (= (arr!37283 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14412)) mapDefault!47192)))))

(declare-fun mapIsEmpty!47192 () Bool)

(assert (=> mapIsEmpty!47192 mapRes!47192))

(declare-fun b!1194173 () Bool)

(assert (=> b!1194173 (= e!678668 false)))

(declare-fun lt!542733 () Bool)

(declare-datatypes ((List!26255 0))(
  ( (Nil!26252) (Cons!26251 (h!27460 (_ BitVec 64)) (t!38926 List!26255)) )
))
(declare-fun arrayNoDuplicates!0 (array!77265 (_ BitVec 32) List!26255) Bool)

(assert (=> b!1194173 (= lt!542733 (arrayNoDuplicates!0 lt!542732 #b00000000000000000000000000000000 Nil!26252))))

(declare-fun mapNonEmpty!47192 () Bool)

(declare-fun tp!89802 () Bool)

(assert (=> mapNonEmpty!47192 (= mapRes!47192 (and tp!89802 e!678672))))

(declare-fun mapValue!47192 () ValueCell!14412)

(declare-fun mapKey!47192 () (_ BitVec 32))

(declare-fun mapRest!47192 () (Array (_ BitVec 32) ValueCell!14412))

(assert (=> mapNonEmpty!47192 (= (arr!37283 _values!996) (store mapRest!47192 mapKey!47192 mapValue!47192))))

(declare-fun b!1194174 () Bool)

(declare-fun res!794522 () Bool)

(assert (=> b!1194174 (=> (not res!794522) (not e!678673))))

(assert (=> b!1194174 (= res!794522 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26252))))

(declare-fun b!1194175 () Bool)

(declare-fun res!794525 () Bool)

(assert (=> b!1194175 (=> (not res!794525) (not e!678673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194175 (= res!794525 (and (= (size!37819 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37818 _keys!1208) (size!37819 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194176 () Bool)

(declare-fun res!794527 () Bool)

(assert (=> b!1194176 (=> (not res!794527) (not e!678673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194176 (= res!794527 (validKeyInArray!0 k0!934))))

(declare-fun b!1194177 () Bool)

(declare-fun res!794520 () Bool)

(assert (=> b!1194177 (=> (not res!794520) (not e!678673))))

(assert (=> b!1194177 (= res!794520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!794521 () Bool)

(assert (=> start!100134 (=> (not res!794521) (not e!678673))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100134 (= res!794521 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37818 _keys!1208))))))

(assert (=> start!100134 e!678673))

(declare-fun array_inv!28422 (array!77265) Bool)

(assert (=> start!100134 (array_inv!28422 _keys!1208)))

(assert (=> start!100134 true))

(declare-fun array_inv!28423 (array!77267) Bool)

(assert (=> start!100134 (and (array_inv!28423 _values!996) e!678671)))

(declare-fun b!1194168 () Bool)

(declare-fun res!794519 () Bool)

(assert (=> b!1194168 (=> (not res!794519) (not e!678673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194168 (= res!794519 (validMask!0 mask!1564))))

(assert (= (and start!100134 res!794521) b!1194168))

(assert (= (and b!1194168 res!794519) b!1194175))

(assert (= (and b!1194175 res!794525) b!1194177))

(assert (= (and b!1194177 res!794520) b!1194174))

(assert (= (and b!1194174 res!794522) b!1194169))

(assert (= (and b!1194169 res!794524) b!1194176))

(assert (= (and b!1194176 res!794527) b!1194166))

(assert (= (and b!1194166 res!794523) b!1194167))

(assert (= (and b!1194167 res!794526) b!1194173))

(assert (= (and b!1194172 condMapEmpty!47192) mapIsEmpty!47192))

(assert (= (and b!1194172 (not condMapEmpty!47192)) mapNonEmpty!47192))

(get-info :version)

(assert (= (and mapNonEmpty!47192 ((_ is ValueCellFull!14412) mapValue!47192)) b!1194171))

(assert (= (and b!1194172 ((_ is ValueCellFull!14412) mapDefault!47192)) b!1194170))

(assert (= start!100134 b!1194172))

(declare-fun m!1102183 () Bool)

(assert (=> b!1194168 m!1102183))

(declare-fun m!1102185 () Bool)

(assert (=> b!1194166 m!1102185))

(declare-fun m!1102187 () Bool)

(assert (=> b!1194174 m!1102187))

(declare-fun m!1102189 () Bool)

(assert (=> b!1194173 m!1102189))

(declare-fun m!1102191 () Bool)

(assert (=> b!1194177 m!1102191))

(declare-fun m!1102193 () Bool)

(assert (=> b!1194176 m!1102193))

(declare-fun m!1102195 () Bool)

(assert (=> b!1194167 m!1102195))

(declare-fun m!1102197 () Bool)

(assert (=> b!1194167 m!1102197))

(declare-fun m!1102199 () Bool)

(assert (=> start!100134 m!1102199))

(declare-fun m!1102201 () Bool)

(assert (=> start!100134 m!1102201))

(declare-fun m!1102203 () Bool)

(assert (=> mapNonEmpty!47192 m!1102203))

(check-sat (not b!1194174) (not b!1194173) (not start!100134) (not b!1194168) tp_is_empty!30243 (not b!1194177) (not mapNonEmpty!47192) (not b!1194167) (not b!1194176))
(check-sat)
