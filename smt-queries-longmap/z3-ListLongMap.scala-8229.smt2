; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100518 () Bool)

(assert start!100518)

(declare-fun b!1197662 () Bool)

(declare-fun res!796688 () Bool)

(declare-fun e!680569 () Bool)

(assert (=> b!1197662 (=> (not res!796688) (not e!680569))))

(declare-datatypes ((array!77515 0))(
  ( (array!77516 (arr!37398 (Array (_ BitVec 32) (_ BitVec 64))) (size!37935 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77515)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77515 (_ BitVec 32)) Bool)

(assert (=> b!1197662 (= res!796688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197663 () Bool)

(declare-fun res!796692 () Bool)

(assert (=> b!1197663 (=> (not res!796692) (not e!680569))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197663 (= res!796692 (validKeyInArray!0 k0!934))))

(declare-fun b!1197664 () Bool)

(declare-fun res!796691 () Bool)

(assert (=> b!1197664 (=> (not res!796691) (not e!680569))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45593 0))(
  ( (V!45594 (val!15231 Int)) )
))
(declare-datatypes ((ValueCell!14465 0))(
  ( (ValueCellFull!14465 (v!17865 V!45593)) (EmptyCell!14465) )
))
(declare-datatypes ((array!77517 0))(
  ( (array!77518 (arr!37399 (Array (_ BitVec 32) ValueCell!14465)) (size!37936 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77517)

(assert (=> b!1197664 (= res!796691 (and (= (size!37936 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37935 _keys!1208) (size!37936 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47360 () Bool)

(declare-fun mapRes!47360 () Bool)

(assert (=> mapIsEmpty!47360 mapRes!47360))

(declare-fun b!1197665 () Bool)

(declare-fun e!680571 () Bool)

(assert (=> b!1197665 (= e!680569 e!680571)))

(declare-fun res!796685 () Bool)

(assert (=> b!1197665 (=> (not res!796685) (not e!680571))))

(declare-fun lt!543555 () array!77515)

(assert (=> b!1197665 (= res!796685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543555 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1197665 (= lt!543555 (array!77516 (store (arr!37398 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37935 _keys!1208)))))

(declare-fun b!1197666 () Bool)

(declare-fun res!796693 () Bool)

(assert (=> b!1197666 (=> (not res!796693) (not e!680569))))

(assert (=> b!1197666 (= res!796693 (= (select (arr!37398 _keys!1208) i!673) k0!934))))

(declare-fun b!1197667 () Bool)

(declare-fun res!796694 () Bool)

(assert (=> b!1197667 (=> (not res!796694) (not e!680569))))

(declare-datatypes ((List!26330 0))(
  ( (Nil!26327) (Cons!26326 (h!27544 (_ BitVec 64)) (t!38993 List!26330)) )
))
(declare-fun arrayNoDuplicates!0 (array!77515 (_ BitVec 32) List!26330) Bool)

(assert (=> b!1197667 (= res!796694 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26327))))

(declare-fun b!1197668 () Bool)

(declare-fun e!680572 () Bool)

(declare-fun tp_is_empty!30349 () Bool)

(assert (=> b!1197668 (= e!680572 tp_is_empty!30349)))

(declare-fun mapNonEmpty!47360 () Bool)

(declare-fun tp!89970 () Bool)

(assert (=> mapNonEmpty!47360 (= mapRes!47360 (and tp!89970 e!680572))))

(declare-fun mapValue!47360 () ValueCell!14465)

(declare-fun mapRest!47360 () (Array (_ BitVec 32) ValueCell!14465))

(declare-fun mapKey!47360 () (_ BitVec 32))

(assert (=> mapNonEmpty!47360 (= (arr!37399 _values!996) (store mapRest!47360 mapKey!47360 mapValue!47360))))

(declare-fun b!1197669 () Bool)

(assert (=> b!1197669 (= e!680571 (not true))))

(declare-fun arrayContainsKey!0 (array!77515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197669 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39639 0))(
  ( (Unit!39640) )
))
(declare-fun lt!543556 () Unit!39639)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77515 (_ BitVec 64) (_ BitVec 32)) Unit!39639)

(assert (=> b!1197669 (= lt!543556 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197670 () Bool)

(declare-fun res!796686 () Bool)

(assert (=> b!1197670 (=> (not res!796686) (not e!680569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197670 (= res!796686 (validMask!0 mask!1564))))

(declare-fun res!796687 () Bool)

(assert (=> start!100518 (=> (not res!796687) (not e!680569))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100518 (= res!796687 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37935 _keys!1208))))))

(assert (=> start!100518 e!680569))

(declare-fun array_inv!28576 (array!77515) Bool)

(assert (=> start!100518 (array_inv!28576 _keys!1208)))

(assert (=> start!100518 true))

(declare-fun e!680573 () Bool)

(declare-fun array_inv!28577 (array!77517) Bool)

(assert (=> start!100518 (and (array_inv!28577 _values!996) e!680573)))

(declare-fun b!1197671 () Bool)

(declare-fun e!680570 () Bool)

(assert (=> b!1197671 (= e!680570 tp_is_empty!30349)))

(declare-fun b!1197672 () Bool)

(declare-fun res!796689 () Bool)

(assert (=> b!1197672 (=> (not res!796689) (not e!680571))))

(assert (=> b!1197672 (= res!796689 (arrayNoDuplicates!0 lt!543555 #b00000000000000000000000000000000 Nil!26327))))

(declare-fun b!1197673 () Bool)

(assert (=> b!1197673 (= e!680573 (and e!680570 mapRes!47360))))

(declare-fun condMapEmpty!47360 () Bool)

(declare-fun mapDefault!47360 () ValueCell!14465)

(assert (=> b!1197673 (= condMapEmpty!47360 (= (arr!37399 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14465)) mapDefault!47360)))))

(declare-fun b!1197674 () Bool)

(declare-fun res!796690 () Bool)

(assert (=> b!1197674 (=> (not res!796690) (not e!680569))))

(assert (=> b!1197674 (= res!796690 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37935 _keys!1208))))))

(assert (= (and start!100518 res!796687) b!1197670))

(assert (= (and b!1197670 res!796686) b!1197664))

(assert (= (and b!1197664 res!796691) b!1197662))

(assert (= (and b!1197662 res!796688) b!1197667))

(assert (= (and b!1197667 res!796694) b!1197674))

(assert (= (and b!1197674 res!796690) b!1197663))

(assert (= (and b!1197663 res!796692) b!1197666))

(assert (= (and b!1197666 res!796693) b!1197665))

(assert (= (and b!1197665 res!796685) b!1197672))

(assert (= (and b!1197672 res!796689) b!1197669))

(assert (= (and b!1197673 condMapEmpty!47360) mapIsEmpty!47360))

(assert (= (and b!1197673 (not condMapEmpty!47360)) mapNonEmpty!47360))

(get-info :version)

(assert (= (and mapNonEmpty!47360 ((_ is ValueCellFull!14465) mapValue!47360)) b!1197668))

(assert (= (and b!1197673 ((_ is ValueCellFull!14465) mapDefault!47360)) b!1197671))

(assert (= start!100518 b!1197673))

(declare-fun m!1105203 () Bool)

(assert (=> b!1197670 m!1105203))

(declare-fun m!1105205 () Bool)

(assert (=> b!1197669 m!1105205))

(declare-fun m!1105207 () Bool)

(assert (=> b!1197669 m!1105207))

(declare-fun m!1105209 () Bool)

(assert (=> b!1197665 m!1105209))

(declare-fun m!1105211 () Bool)

(assert (=> b!1197665 m!1105211))

(declare-fun m!1105213 () Bool)

(assert (=> b!1197666 m!1105213))

(declare-fun m!1105215 () Bool)

(assert (=> b!1197672 m!1105215))

(declare-fun m!1105217 () Bool)

(assert (=> mapNonEmpty!47360 m!1105217))

(declare-fun m!1105219 () Bool)

(assert (=> b!1197667 m!1105219))

(declare-fun m!1105221 () Bool)

(assert (=> start!100518 m!1105221))

(declare-fun m!1105223 () Bool)

(assert (=> start!100518 m!1105223))

(declare-fun m!1105225 () Bool)

(assert (=> b!1197663 m!1105225))

(declare-fun m!1105227 () Bool)

(assert (=> b!1197662 m!1105227))

(check-sat tp_is_empty!30349 (not b!1197662) (not b!1197672) (not b!1197667) (not b!1197663) (not b!1197669) (not b!1197670) (not start!100518) (not mapNonEmpty!47360) (not b!1197665))
(check-sat)
