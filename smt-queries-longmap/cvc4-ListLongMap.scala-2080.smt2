; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35652 () Bool)

(assert start!35652)

(declare-fun b_free!7907 () Bool)

(declare-fun b_next!7907 () Bool)

(assert (=> start!35652 (= b_free!7907 (not b_next!7907))))

(declare-fun tp!27705 () Bool)

(declare-fun b_and!15149 () Bool)

(assert (=> start!35652 (= tp!27705 b_and!15149)))

(declare-fun b!358007 () Bool)

(declare-fun res!198945 () Bool)

(declare-fun e!219147 () Bool)

(assert (=> b!358007 (=> (not res!198945) (not e!219147))))

(declare-datatypes ((array!19777 0))(
  ( (array!19778 (arr!9382 (Array (_ BitVec 32) (_ BitVec 64))) (size!9734 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19777)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19777 (_ BitVec 32)) Bool)

(assert (=> b!358007 (= res!198945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358008 () Bool)

(declare-fun e!219144 () Bool)

(declare-fun tp_is_empty!8105 () Bool)

(assert (=> b!358008 (= e!219144 tp_is_empty!8105)))

(declare-fun b!358009 () Bool)

(declare-fun res!198941 () Bool)

(assert (=> b!358009 (=> (not res!198941) (not e!219147))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!358009 (= res!198941 (not (= (select (arr!9382 _keys!1456) from!1805) k!1077)))))

(declare-fun b!358010 () Bool)

(declare-fun e!219149 () Bool)

(assert (=> b!358010 (= e!219147 (not e!219149))))

(declare-fun res!198944 () Bool)

(assert (=> b!358010 (=> res!198944 e!219149)))

(assert (=> b!358010 (= res!198944 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9734 _keys!1456))))))

(declare-fun arrayContainsKey!0 (array!19777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358010 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11783 0))(
  ( (V!11784 (val!4097 Int)) )
))
(declare-datatypes ((ValueCell!3709 0))(
  ( (ValueCellFull!3709 (v!6291 V!11783)) (EmptyCell!3709) )
))
(declare-datatypes ((array!19779 0))(
  ( (array!19780 (arr!9383 (Array (_ BitVec 32) ValueCell!3709)) (size!9735 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19779)

(declare-datatypes ((Unit!11040 0))(
  ( (Unit!11041) )
))
(declare-fun lt!166136 () Unit!11040)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11783)

(declare-fun minValue!1150 () V!11783)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!38 (array!19777 array!19779 (_ BitVec 32) (_ BitVec 32) V!11783 V!11783 (_ BitVec 64) (_ BitVec 32)) Unit!11040)

(assert (=> b!358010 (= lt!166136 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!38 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!358011 () Bool)

(declare-fun res!198938 () Bool)

(assert (=> b!358011 (=> (not res!198938) (not e!219147))))

(assert (=> b!358011 (= res!198938 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9734 _keys!1456))))))

(declare-fun res!198946 () Bool)

(assert (=> start!35652 (=> (not res!198946) (not e!219147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35652 (= res!198946 (validMask!0 mask!1842))))

(assert (=> start!35652 e!219147))

(assert (=> start!35652 tp_is_empty!8105))

(assert (=> start!35652 true))

(assert (=> start!35652 tp!27705))

(declare-fun array_inv!6896 (array!19777) Bool)

(assert (=> start!35652 (array_inv!6896 _keys!1456)))

(declare-fun e!219145 () Bool)

(declare-fun array_inv!6897 (array!19779) Bool)

(assert (=> start!35652 (and (array_inv!6897 _values!1208) e!219145)))

(declare-fun b!358012 () Bool)

(declare-fun res!198943 () Bool)

(assert (=> b!358012 (=> (not res!198943) (not e!219147))))

(assert (=> b!358012 (= res!198943 (and (= (size!9735 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9734 _keys!1456) (size!9735 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13665 () Bool)

(declare-fun mapRes!13665 () Bool)

(assert (=> mapIsEmpty!13665 mapRes!13665))

(declare-fun b!358013 () Bool)

(declare-fun res!198940 () Bool)

(assert (=> b!358013 (=> (not res!198940) (not e!219147))))

(assert (=> b!358013 (= res!198940 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun mapNonEmpty!13665 () Bool)

(declare-fun tp!27704 () Bool)

(assert (=> mapNonEmpty!13665 (= mapRes!13665 (and tp!27704 e!219144))))

(declare-fun mapKey!13665 () (_ BitVec 32))

(declare-fun mapValue!13665 () ValueCell!3709)

(declare-fun mapRest!13665 () (Array (_ BitVec 32) ValueCell!3709))

(assert (=> mapNonEmpty!13665 (= (arr!9383 _values!1208) (store mapRest!13665 mapKey!13665 mapValue!13665))))

(declare-fun b!358014 () Bool)

(declare-fun res!198939 () Bool)

(assert (=> b!358014 (=> (not res!198939) (not e!219147))))

(declare-datatypes ((List!5416 0))(
  ( (Nil!5413) (Cons!5412 (h!6268 (_ BitVec 64)) (t!10566 List!5416)) )
))
(declare-fun arrayNoDuplicates!0 (array!19777 (_ BitVec 32) List!5416) Bool)

(assert (=> b!358014 (= res!198939 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5413))))

(declare-fun b!358015 () Bool)

(declare-fun res!198942 () Bool)

(assert (=> b!358015 (=> (not res!198942) (not e!219147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358015 (= res!198942 (validKeyInArray!0 k!1077))))

(declare-fun b!358016 () Bool)

(declare-fun e!219146 () Bool)

(assert (=> b!358016 (= e!219146 tp_is_empty!8105)))

(declare-fun b!358017 () Bool)

(assert (=> b!358017 (= e!219145 (and e!219146 mapRes!13665))))

(declare-fun condMapEmpty!13665 () Bool)

(declare-fun mapDefault!13665 () ValueCell!3709)

