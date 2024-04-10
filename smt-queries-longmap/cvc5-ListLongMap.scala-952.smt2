; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20808 () Bool)

(assert start!20808)

(declare-fun b_free!5461 () Bool)

(declare-fun b_next!5461 () Bool)

(assert (=> start!20808 (= b_free!5461 (not b_next!5461))))

(declare-fun tp!19424 () Bool)

(declare-fun b_and!12207 () Bool)

(assert (=> start!20808 (= tp!19424 b_and!12207)))

(declare-fun b!208580 () Bool)

(declare-fun res!101500 () Bool)

(declare-fun e!136019 () Bool)

(assert (=> b!208580 (=> (not res!101500) (not e!136019))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9849 0))(
  ( (array!9850 (arr!4675 (Array (_ BitVec 32) (_ BitVec 64))) (size!5000 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9849)

(assert (=> b!208580 (= res!101500 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5000 _keys!825))))))

(declare-fun b!208581 () Bool)

(declare-fun e!136017 () Bool)

(declare-fun tp_is_empty!5323 () Bool)

(assert (=> b!208581 (= e!136017 tp_is_empty!5323)))

(declare-fun b!208582 () Bool)

(declare-fun res!101495 () Bool)

(assert (=> b!208582 (=> (not res!101495) (not e!136019))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((V!6745 0))(
  ( (V!6746 (val!2706 Int)) )
))
(declare-datatypes ((ValueCell!2318 0))(
  ( (ValueCellFull!2318 (v!4676 V!6745)) (EmptyCell!2318) )
))
(declare-datatypes ((array!9851 0))(
  ( (array!9852 (arr!4676 (Array (_ BitVec 32) ValueCell!2318)) (size!5001 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9851)

(assert (=> b!208582 (= res!101495 (and (= (size!5001 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5000 _keys!825) (size!5001 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9053 () Bool)

(declare-fun mapRes!9053 () Bool)

(declare-fun tp!19423 () Bool)

(declare-fun e!136018 () Bool)

(assert (=> mapNonEmpty!9053 (= mapRes!9053 (and tp!19423 e!136018))))

(declare-fun mapRest!9053 () (Array (_ BitVec 32) ValueCell!2318))

(declare-fun mapKey!9053 () (_ BitVec 32))

(declare-fun mapValue!9053 () ValueCell!2318)

(assert (=> mapNonEmpty!9053 (= (arr!4676 _values!649) (store mapRest!9053 mapKey!9053 mapValue!9053))))

(declare-fun res!101497 () Bool)

(assert (=> start!20808 (=> (not res!101497) (not e!136019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20808 (= res!101497 (validMask!0 mask!1149))))

(assert (=> start!20808 e!136019))

(declare-fun e!136015 () Bool)

(declare-fun array_inv!3101 (array!9851) Bool)

(assert (=> start!20808 (and (array_inv!3101 _values!649) e!136015)))

(assert (=> start!20808 true))

(assert (=> start!20808 tp_is_empty!5323))

(declare-fun array_inv!3102 (array!9849) Bool)

(assert (=> start!20808 (array_inv!3102 _keys!825)))

(assert (=> start!20808 tp!19424))

(declare-fun b!208583 () Bool)

(assert (=> b!208583 (= e!136015 (and e!136017 mapRes!9053))))

(declare-fun condMapEmpty!9053 () Bool)

(declare-fun mapDefault!9053 () ValueCell!2318)

