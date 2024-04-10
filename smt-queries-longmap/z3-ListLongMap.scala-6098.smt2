; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78698 () Bool)

(assert start!78698)

(declare-fun b_free!16911 () Bool)

(declare-fun b_next!16911 () Bool)

(assert (=> start!78698 (= b_free!16911 (not b_next!16911))))

(declare-fun tp!59173 () Bool)

(declare-fun b_and!27559 () Bool)

(assert (=> start!78698 (= tp!59173 b_and!27559)))

(declare-fun b!917755 () Bool)

(declare-fun e!515225 () Bool)

(declare-fun e!515224 () Bool)

(assert (=> b!917755 (= e!515225 e!515224)))

(declare-fun res!618736 () Bool)

(assert (=> b!917755 (=> (not res!618736) (not e!515224))))

(declare-datatypes ((V!30857 0))(
  ( (V!30858 (val!9760 Int)) )
))
(declare-datatypes ((tuple2!12678 0))(
  ( (tuple2!12679 (_1!6350 (_ BitVec 64)) (_2!6350 V!30857)) )
))
(declare-datatypes ((List!18487 0))(
  ( (Nil!18484) (Cons!18483 (h!19629 tuple2!12678) (t!26128 List!18487)) )
))
(declare-datatypes ((ListLongMap!11375 0))(
  ( (ListLongMap!11376 (toList!5703 List!18487)) )
))
(declare-fun lt!412084 () ListLongMap!11375)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4754 (ListLongMap!11375 (_ BitVec 64)) Bool)

(assert (=> b!917755 (= res!618736 (contains!4754 lt!412084 k0!1099))))

(declare-datatypes ((array!54824 0))(
  ( (array!54825 (arr!26357 (Array (_ BitVec 32) (_ BitVec 64))) (size!26816 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54824)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9228 0))(
  ( (ValueCellFull!9228 (v!12278 V!30857)) (EmptyCell!9228) )
))
(declare-datatypes ((array!54826 0))(
  ( (array!54827 (arr!26358 (Array (_ BitVec 32) ValueCell!9228)) (size!26817 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54826)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30857)

(declare-fun minValue!1173 () V!30857)

(declare-fun getCurrentListMap!2961 (array!54824 array!54826 (_ BitVec 32) (_ BitVec 32) V!30857 V!30857 (_ BitVec 32) Int) ListLongMap!11375)

(assert (=> b!917755 (= lt!412084 (getCurrentListMap!2961 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917756 () Bool)

(declare-fun e!515227 () Bool)

(declare-fun e!515230 () Bool)

(declare-fun mapRes!30885 () Bool)

(assert (=> b!917756 (= e!515227 (and e!515230 mapRes!30885))))

(declare-fun condMapEmpty!30885 () Bool)

(declare-fun mapDefault!30885 () ValueCell!9228)

(assert (=> b!917756 (= condMapEmpty!30885 (= (arr!26358 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9228)) mapDefault!30885)))))

(declare-fun mapIsEmpty!30885 () Bool)

(assert (=> mapIsEmpty!30885 mapRes!30885))

(declare-fun b!917757 () Bool)

(declare-fun e!515226 () Bool)

(declare-fun tp_is_empty!19419 () Bool)

(assert (=> b!917757 (= e!515226 tp_is_empty!19419)))

(declare-fun b!917758 () Bool)

(declare-fun res!618738 () Bool)

(assert (=> b!917758 (=> (not res!618738) (not e!515224))))

(assert (=> b!917758 (= res!618738 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!917759 () Bool)

(declare-fun res!618730 () Bool)

(assert (=> b!917759 (=> (not res!618730) (not e!515225))))

(assert (=> b!917759 (= res!618730 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26816 _keys!1487))))))

(declare-fun b!917760 () Bool)

(declare-fun res!618734 () Bool)

(assert (=> b!917760 (=> (not res!618734) (not e!515225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54824 (_ BitVec 32)) Bool)

(assert (=> b!917760 (= res!618734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917761 () Bool)

(declare-fun res!618733 () Bool)

(assert (=> b!917761 (=> (not res!618733) (not e!515224))))

(declare-fun v!791 () V!30857)

(declare-fun apply!555 (ListLongMap!11375 (_ BitVec 64)) V!30857)

(assert (=> b!917761 (= res!618733 (= (apply!555 lt!412084 k0!1099) v!791))))

(declare-fun b!917762 () Bool)

(assert (=> b!917762 (= e!515230 tp_is_empty!19419)))

(declare-fun b!917763 () Bool)

(declare-fun e!515228 () Bool)

(assert (=> b!917763 (= e!515228 (not true))))

(declare-fun lt!412083 () (_ BitVec 64))

(declare-fun +!2618 (ListLongMap!11375 tuple2!12678) ListLongMap!11375)

(declare-fun get!13811 (ValueCell!9228 V!30857) V!30857)

(declare-fun dynLambda!1407 (Int (_ BitVec 64)) V!30857)

(assert (=> b!917763 (= (getCurrentListMap!2961 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2618 (getCurrentListMap!2961 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12679 lt!412083 (get!13811 (select (arr!26358 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1407 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30984 0))(
  ( (Unit!30985) )
))
(declare-fun lt!412082 () Unit!30984)

(declare-fun lemmaListMapRecursiveValidKeyArray!8 (array!54824 array!54826 (_ BitVec 32) (_ BitVec 32) V!30857 V!30857 (_ BitVec 32) Int) Unit!30984)

(assert (=> b!917763 (= lt!412082 (lemmaListMapRecursiveValidKeyArray!8 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!30885 () Bool)

(declare-fun tp!59174 () Bool)

(assert (=> mapNonEmpty!30885 (= mapRes!30885 (and tp!59174 e!515226))))

(declare-fun mapRest!30885 () (Array (_ BitVec 32) ValueCell!9228))

(declare-fun mapValue!30885 () ValueCell!9228)

(declare-fun mapKey!30885 () (_ BitVec 32))

(assert (=> mapNonEmpty!30885 (= (arr!26358 _values!1231) (store mapRest!30885 mapKey!30885 mapValue!30885))))

(declare-fun res!618739 () Bool)

(assert (=> start!78698 (=> (not res!618739) (not e!515225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78698 (= res!618739 (validMask!0 mask!1881))))

(assert (=> start!78698 e!515225))

(assert (=> start!78698 true))

(assert (=> start!78698 tp_is_empty!19419))

(declare-fun array_inv!20554 (array!54826) Bool)

(assert (=> start!78698 (and (array_inv!20554 _values!1231) e!515227)))

(assert (=> start!78698 tp!59173))

(declare-fun array_inv!20555 (array!54824) Bool)

(assert (=> start!78698 (array_inv!20555 _keys!1487)))

(declare-fun b!917764 () Bool)

(assert (=> b!917764 (= e!515224 e!515228)))

(declare-fun res!618735 () Bool)

(assert (=> b!917764 (=> (not res!618735) (not e!515228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917764 (= res!618735 (validKeyInArray!0 lt!412083))))

(assert (=> b!917764 (= lt!412083 (select (arr!26357 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917765 () Bool)

(declare-fun res!618732 () Bool)

(assert (=> b!917765 (=> (not res!618732) (not e!515225))))

(declare-datatypes ((List!18488 0))(
  ( (Nil!18485) (Cons!18484 (h!19630 (_ BitVec 64)) (t!26129 List!18488)) )
))
(declare-fun arrayNoDuplicates!0 (array!54824 (_ BitVec 32) List!18488) Bool)

(assert (=> b!917765 (= res!618732 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18485))))

(declare-fun b!917766 () Bool)

(declare-fun res!618737 () Bool)

(assert (=> b!917766 (=> (not res!618737) (not e!515224))))

(assert (=> b!917766 (= res!618737 (validKeyInArray!0 k0!1099))))

(declare-fun b!917767 () Bool)

(declare-fun res!618731 () Bool)

(assert (=> b!917767 (=> (not res!618731) (not e!515225))))

(assert (=> b!917767 (= res!618731 (and (= (size!26817 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26816 _keys!1487) (size!26817 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78698 res!618739) b!917767))

(assert (= (and b!917767 res!618731) b!917760))

(assert (= (and b!917760 res!618734) b!917765))

(assert (= (and b!917765 res!618732) b!917759))

(assert (= (and b!917759 res!618730) b!917755))

(assert (= (and b!917755 res!618736) b!917761))

(assert (= (and b!917761 res!618733) b!917758))

(assert (= (and b!917758 res!618738) b!917766))

(assert (= (and b!917766 res!618737) b!917764))

(assert (= (and b!917764 res!618735) b!917763))

(assert (= (and b!917756 condMapEmpty!30885) mapIsEmpty!30885))

(assert (= (and b!917756 (not condMapEmpty!30885)) mapNonEmpty!30885))

(get-info :version)

(assert (= (and mapNonEmpty!30885 ((_ is ValueCellFull!9228) mapValue!30885)) b!917757))

(assert (= (and b!917756 ((_ is ValueCellFull!9228) mapDefault!30885)) b!917762))

(assert (= start!78698 b!917756))

(declare-fun b_lambda!13413 () Bool)

(assert (=> (not b_lambda!13413) (not b!917763)))

(declare-fun t!26127 () Bool)

(declare-fun tb!5491 () Bool)

(assert (=> (and start!78698 (= defaultEntry!1235 defaultEntry!1235) t!26127) tb!5491))

(declare-fun result!10805 () Bool)

(assert (=> tb!5491 (= result!10805 tp_is_empty!19419)))

(assert (=> b!917763 t!26127))

(declare-fun b_and!27561 () Bool)

(assert (= b_and!27559 (and (=> t!26127 result!10805) b_and!27561)))

(declare-fun m!851477 () Bool)

(assert (=> b!917765 m!851477))

(declare-fun m!851479 () Bool)

(assert (=> b!917761 m!851479))

(declare-fun m!851481 () Bool)

(assert (=> b!917764 m!851481))

(declare-fun m!851483 () Bool)

(assert (=> b!917764 m!851483))

(declare-fun m!851485 () Bool)

(assert (=> b!917755 m!851485))

(declare-fun m!851487 () Bool)

(assert (=> b!917755 m!851487))

(declare-fun m!851489 () Bool)

(assert (=> b!917760 m!851489))

(declare-fun m!851491 () Bool)

(assert (=> mapNonEmpty!30885 m!851491))

(declare-fun m!851493 () Bool)

(assert (=> start!78698 m!851493))

(declare-fun m!851495 () Bool)

(assert (=> start!78698 m!851495))

(declare-fun m!851497 () Bool)

(assert (=> start!78698 m!851497))

(declare-fun m!851499 () Bool)

(assert (=> b!917763 m!851499))

(declare-fun m!851501 () Bool)

(assert (=> b!917763 m!851501))

(declare-fun m!851503 () Bool)

(assert (=> b!917763 m!851503))

(declare-fun m!851505 () Bool)

(assert (=> b!917763 m!851505))

(assert (=> b!917763 m!851503))

(assert (=> b!917763 m!851505))

(declare-fun m!851507 () Bool)

(assert (=> b!917763 m!851507))

(declare-fun m!851509 () Bool)

(assert (=> b!917763 m!851509))

(assert (=> b!917763 m!851499))

(declare-fun m!851511 () Bool)

(assert (=> b!917763 m!851511))

(declare-fun m!851513 () Bool)

(assert (=> b!917766 m!851513))

(check-sat (not b!917763) (not b!917755) tp_is_empty!19419 (not start!78698) (not mapNonEmpty!30885) (not b_next!16911) (not b!917766) b_and!27561 (not b_lambda!13413) (not b!917761) (not b!917764) (not b!917765) (not b!917760))
(check-sat b_and!27561 (not b_next!16911))
