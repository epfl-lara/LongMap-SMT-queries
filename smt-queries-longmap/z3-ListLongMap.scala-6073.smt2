; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78548 () Bool)

(assert start!78548)

(declare-fun b!915629 () Bool)

(declare-fun res!617308 () Bool)

(declare-fun e!513930 () Bool)

(assert (=> b!915629 (=> (not res!617308) (not e!513930))))

(declare-datatypes ((array!54532 0))(
  ( (array!54533 (arr!26211 (Array (_ BitVec 32) (_ BitVec 64))) (size!26670 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54532)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30657 0))(
  ( (V!30658 (val!9685 Int)) )
))
(declare-datatypes ((ValueCell!9153 0))(
  ( (ValueCellFull!9153 (v!12203 V!30657)) (EmptyCell!9153) )
))
(declare-datatypes ((array!54534 0))(
  ( (array!54535 (arr!26212 (Array (_ BitVec 32) ValueCell!9153)) (size!26671 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54534)

(assert (=> b!915629 (= res!617308 (and (= (size!26671 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26670 _keys!1487) (size!26671 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30660 () Bool)

(declare-fun mapRes!30660 () Bool)

(assert (=> mapIsEmpty!30660 mapRes!30660))

(declare-fun res!617305 () Bool)

(assert (=> start!78548 (=> (not res!617305) (not e!513930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78548 (= res!617305 (validMask!0 mask!1881))))

(assert (=> start!78548 e!513930))

(declare-fun array_inv!20456 (array!54532) Bool)

(assert (=> start!78548 (array_inv!20456 _keys!1487)))

(assert (=> start!78548 true))

(declare-fun e!513929 () Bool)

(declare-fun array_inv!20457 (array!54534) Bool)

(assert (=> start!78548 (and (array_inv!20457 _values!1231) e!513929)))

(declare-fun b!915630 () Bool)

(declare-fun e!513928 () Bool)

(declare-fun tp_is_empty!19269 () Bool)

(assert (=> b!915630 (= e!513928 tp_is_empty!19269)))

(declare-fun b!915631 () Bool)

(declare-fun e!513931 () Bool)

(assert (=> b!915631 (= e!513931 tp_is_empty!19269)))

(declare-fun mapNonEmpty!30660 () Bool)

(declare-fun tp!58727 () Bool)

(assert (=> mapNonEmpty!30660 (= mapRes!30660 (and tp!58727 e!513928))))

(declare-fun mapValue!30660 () ValueCell!9153)

(declare-fun mapRest!30660 () (Array (_ BitVec 32) ValueCell!9153))

(declare-fun mapKey!30660 () (_ BitVec 32))

(assert (=> mapNonEmpty!30660 (= (arr!26212 _values!1231) (store mapRest!30660 mapKey!30660 mapValue!30660))))

(declare-fun b!915632 () Bool)

(declare-fun res!617306 () Bool)

(assert (=> b!915632 (=> (not res!617306) (not e!513930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54532 (_ BitVec 32)) Bool)

(assert (=> b!915632 (= res!617306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915633 () Bool)

(assert (=> b!915633 (= e!513929 (and e!513931 mapRes!30660))))

(declare-fun condMapEmpty!30660 () Bool)

(declare-fun mapDefault!30660 () ValueCell!9153)

(assert (=> b!915633 (= condMapEmpty!30660 (= (arr!26212 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9153)) mapDefault!30660)))))

(declare-fun b!915634 () Bool)

(declare-fun res!617307 () Bool)

(assert (=> b!915634 (=> (not res!617307) (not e!513930))))

(declare-datatypes ((List!18381 0))(
  ( (Nil!18378) (Cons!18377 (h!19523 (_ BitVec 64)) (t!25994 List!18381)) )
))
(declare-fun arrayNoDuplicates!0 (array!54532 (_ BitVec 32) List!18381) Bool)

(assert (=> b!915634 (= res!617307 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18378))))

(declare-fun b!915635 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!915635 (= e!513930 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26670 _keys!1487)) (bvsgt from!1844 (size!26670 _keys!1487))))))

(assert (= (and start!78548 res!617305) b!915629))

(assert (= (and b!915629 res!617308) b!915632))

(assert (= (and b!915632 res!617306) b!915634))

(assert (= (and b!915634 res!617307) b!915635))

(assert (= (and b!915633 condMapEmpty!30660) mapIsEmpty!30660))

(assert (= (and b!915633 (not condMapEmpty!30660)) mapNonEmpty!30660))

(get-info :version)

(assert (= (and mapNonEmpty!30660 ((_ is ValueCellFull!9153) mapValue!30660)) b!915630))

(assert (= (and b!915633 ((_ is ValueCellFull!9153) mapDefault!30660)) b!915631))

(assert (= start!78548 b!915633))

(declare-fun m!849939 () Bool)

(assert (=> start!78548 m!849939))

(declare-fun m!849941 () Bool)

(assert (=> start!78548 m!849941))

(declare-fun m!849943 () Bool)

(assert (=> start!78548 m!849943))

(declare-fun m!849945 () Bool)

(assert (=> mapNonEmpty!30660 m!849945))

(declare-fun m!849947 () Bool)

(assert (=> b!915632 m!849947))

(declare-fun m!849949 () Bool)

(assert (=> b!915634 m!849949))

(check-sat (not b!915634) (not start!78548) (not b!915632) tp_is_empty!19269 (not mapNonEmpty!30660))
(check-sat)
