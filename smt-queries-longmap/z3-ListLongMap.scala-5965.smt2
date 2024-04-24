; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77784 () Bool)

(assert start!77784)

(declare-fun b_free!16201 () Bool)

(declare-fun b_next!16201 () Bool)

(assert (=> start!77784 (= b_free!16201 (not b_next!16201))))

(declare-fun tp!56866 () Bool)

(declare-fun b_and!26577 () Bool)

(assert (=> start!77784 (= tp!56866 b_and!26577)))

(declare-fun b!905562 () Bool)

(declare-fun res!610767 () Bool)

(declare-fun e!507508 () Bool)

(assert (=> b!905562 (=> (not res!610767) (not e!507508))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53327 0))(
  ( (array!53328 (arr!25618 (Array (_ BitVec 32) (_ BitVec 64))) (size!26078 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53327)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!905562 (= res!610767 (and (= (select (arr!25618 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905563 () Bool)

(declare-fun e!507505 () Bool)

(declare-fun tp_is_empty!18619 () Bool)

(assert (=> b!905563 (= e!507505 tp_is_empty!18619)))

(declare-fun b!905564 () Bool)

(declare-fun e!507506 () Bool)

(declare-fun e!507504 () Bool)

(assert (=> b!905564 (= e!507506 e!507504)))

(declare-fun res!610762 () Bool)

(assert (=> b!905564 (=> res!610762 e!507504)))

(declare-datatypes ((V!29791 0))(
  ( (V!29792 (val!9360 Int)) )
))
(declare-datatypes ((tuple2!12096 0))(
  ( (tuple2!12097 (_1!6059 (_ BitVec 64)) (_2!6059 V!29791)) )
))
(declare-datatypes ((List!17943 0))(
  ( (Nil!17940) (Cons!17939 (h!19091 tuple2!12096) (t!25318 List!17943)) )
))
(declare-datatypes ((ListLongMap!10795 0))(
  ( (ListLongMap!10796 (toList!5413 List!17943)) )
))
(declare-fun lt!408650 () ListLongMap!10795)

(declare-fun contains!4469 (ListLongMap!10795 (_ BitVec 64)) Bool)

(assert (=> b!905564 (= res!610762 (not (contains!4469 lt!408650 k0!1033)))))

(declare-datatypes ((ValueCell!8828 0))(
  ( (ValueCellFull!8828 (v!11862 V!29791)) (EmptyCell!8828) )
))
(declare-datatypes ((array!53329 0))(
  ( (array!53330 (arr!25619 (Array (_ BitVec 32) ValueCell!8828)) (size!26079 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53329)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29791)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29791)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun getCurrentListMap!2680 (array!53327 array!53329 (_ BitVec 32) (_ BitVec 32) V!29791 V!29791 (_ BitVec 32) Int) ListLongMap!10795)

(assert (=> b!905564 (= lt!408650 (getCurrentListMap!2680 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905565 () Bool)

(declare-fun res!610765 () Bool)

(assert (=> b!905565 (=> (not res!610765) (not e!507508))))

(assert (=> b!905565 (= res!610765 (and (= (size!26079 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26078 _keys!1386) (size!26079 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905566 () Bool)

(declare-fun res!610763 () Bool)

(assert (=> b!905566 (=> (not res!610763) (not e!507508))))

(declare-datatypes ((List!17944 0))(
  ( (Nil!17941) (Cons!17940 (h!19092 (_ BitVec 64)) (t!25319 List!17944)) )
))
(declare-fun arrayNoDuplicates!0 (array!53327 (_ BitVec 32) List!17944) Bool)

(assert (=> b!905566 (= res!610763 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17941))))

(declare-fun res!610764 () Bool)

(assert (=> start!77784 (=> (not res!610764) (not e!507508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77784 (= res!610764 (validMask!0 mask!1756))))

(assert (=> start!77784 e!507508))

(declare-fun e!507507 () Bool)

(declare-fun array_inv!20130 (array!53329) Bool)

(assert (=> start!77784 (and (array_inv!20130 _values!1152) e!507507)))

(assert (=> start!77784 tp!56866))

(assert (=> start!77784 true))

(assert (=> start!77784 tp_is_empty!18619))

(declare-fun array_inv!20131 (array!53327) Bool)

(assert (=> start!77784 (array_inv!20131 _keys!1386)))

(declare-fun b!905567 () Bool)

(assert (=> b!905567 (= e!507508 (not e!507506))))

(declare-fun res!610768 () Bool)

(assert (=> b!905567 (=> res!610768 e!507506)))

(assert (=> b!905567 (= res!610768 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26078 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905567 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30688 0))(
  ( (Unit!30689) )
))
(declare-fun lt!408652 () Unit!30688)

(declare-fun lemmaKeyInListMapIsInArray!191 (array!53327 array!53329 (_ BitVec 32) (_ BitVec 32) V!29791 V!29791 (_ BitVec 64) Int) Unit!30688)

(assert (=> b!905567 (= lt!408652 (lemmaKeyInListMapIsInArray!191 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!29641 () Bool)

(declare-fun mapRes!29641 () Bool)

(assert (=> mapIsEmpty!29641 mapRes!29641))

(declare-fun b!905568 () Bool)

(declare-fun e!507509 () Bool)

(assert (=> b!905568 (= e!507507 (and e!507509 mapRes!29641))))

(declare-fun condMapEmpty!29641 () Bool)

(declare-fun mapDefault!29641 () ValueCell!8828)

(assert (=> b!905568 (= condMapEmpty!29641 (= (arr!25619 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8828)) mapDefault!29641)))))

(declare-fun b!905569 () Bool)

(declare-fun res!610760 () Bool)

(assert (=> b!905569 (=> (not res!610760) (not e!507508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53327 (_ BitVec 32)) Bool)

(assert (=> b!905569 (= res!610760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905570 () Bool)

(declare-fun res!610761 () Bool)

(assert (=> b!905570 (=> (not res!610761) (not e!507508))))

(assert (=> b!905570 (= res!610761 (contains!4469 (getCurrentListMap!2680 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!905571 () Bool)

(assert (=> b!905571 (= e!507509 tp_is_empty!18619)))

(declare-fun mapNonEmpty!29641 () Bool)

(declare-fun tp!56865 () Bool)

(assert (=> mapNonEmpty!29641 (= mapRes!29641 (and tp!56865 e!507505))))

(declare-fun mapRest!29641 () (Array (_ BitVec 32) ValueCell!8828))

(declare-fun mapValue!29641 () ValueCell!8828)

(declare-fun mapKey!29641 () (_ BitVec 32))

(assert (=> mapNonEmpty!29641 (= (arr!25619 _values!1152) (store mapRest!29641 mapKey!29641 mapValue!29641))))

(declare-fun b!905572 () Bool)

(assert (=> b!905572 (= e!507504 true)))

(declare-fun lt!408651 () V!29791)

(declare-fun apply!439 (ListLongMap!10795 (_ BitVec 64)) V!29791)

(assert (=> b!905572 (= lt!408651 (apply!439 lt!408650 k0!1033))))

(declare-fun b!905573 () Bool)

(declare-fun res!610766 () Bool)

(assert (=> b!905573 (=> (not res!610766) (not e!507508))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905573 (= res!610766 (inRange!0 i!717 mask!1756))))

(assert (= (and start!77784 res!610764) b!905565))

(assert (= (and b!905565 res!610765) b!905569))

(assert (= (and b!905569 res!610760) b!905566))

(assert (= (and b!905566 res!610763) b!905570))

(assert (= (and b!905570 res!610761) b!905573))

(assert (= (and b!905573 res!610766) b!905562))

(assert (= (and b!905562 res!610767) b!905567))

(assert (= (and b!905567 (not res!610768)) b!905564))

(assert (= (and b!905564 (not res!610762)) b!905572))

(assert (= (and b!905568 condMapEmpty!29641) mapIsEmpty!29641))

(assert (= (and b!905568 (not condMapEmpty!29641)) mapNonEmpty!29641))

(get-info :version)

(assert (= (and mapNonEmpty!29641 ((_ is ValueCellFull!8828) mapValue!29641)) b!905563))

(assert (= (and b!905568 ((_ is ValueCellFull!8828) mapDefault!29641)) b!905571))

(assert (= start!77784 b!905568))

(declare-fun m!841409 () Bool)

(assert (=> mapNonEmpty!29641 m!841409))

(declare-fun m!841411 () Bool)

(assert (=> b!905570 m!841411))

(assert (=> b!905570 m!841411))

(declare-fun m!841413 () Bool)

(assert (=> b!905570 m!841413))

(declare-fun m!841415 () Bool)

(assert (=> b!905566 m!841415))

(declare-fun m!841417 () Bool)

(assert (=> b!905562 m!841417))

(declare-fun m!841419 () Bool)

(assert (=> b!905572 m!841419))

(declare-fun m!841421 () Bool)

(assert (=> b!905564 m!841421))

(declare-fun m!841423 () Bool)

(assert (=> b!905564 m!841423))

(declare-fun m!841425 () Bool)

(assert (=> b!905567 m!841425))

(declare-fun m!841427 () Bool)

(assert (=> b!905567 m!841427))

(declare-fun m!841429 () Bool)

(assert (=> b!905569 m!841429))

(declare-fun m!841431 () Bool)

(assert (=> start!77784 m!841431))

(declare-fun m!841433 () Bool)

(assert (=> start!77784 m!841433))

(declare-fun m!841435 () Bool)

(assert (=> start!77784 m!841435))

(declare-fun m!841437 () Bool)

(assert (=> b!905573 m!841437))

(check-sat (not b!905569) (not b!905570) tp_is_empty!18619 (not b!905572) b_and!26577 (not b!905566) (not b_next!16201) (not b!905564) (not b!905573) (not mapNonEmpty!29641) (not start!77784) (not b!905567))
(check-sat b_and!26577 (not b_next!16201))
