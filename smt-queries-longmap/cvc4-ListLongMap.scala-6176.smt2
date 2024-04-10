; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79168 () Bool)

(assert start!79168)

(declare-fun b_free!17381 () Bool)

(declare-fun b_next!17381 () Bool)

(assert (=> start!79168 (= b_free!17381 (not b_next!17381))))

(declare-fun tp!60583 () Bool)

(declare-fun b_and!28447 () Bool)

(assert (=> start!79168 (= tp!60583 b_and!28447)))

(declare-fun mapIsEmpty!31590 () Bool)

(declare-fun mapRes!31590 () Bool)

(assert (=> mapIsEmpty!31590 mapRes!31590))

(declare-fun b!929303 () Bool)

(declare-fun res!625785 () Bool)

(declare-fun e!521855 () Bool)

(assert (=> b!929303 (=> (not res!625785) (not e!521855))))

(declare-datatypes ((array!55732 0))(
  ( (array!55733 (arr!26811 (Array (_ BitVec 32) (_ BitVec 64))) (size!27270 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55732)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55732 (_ BitVec 32)) Bool)

(assert (=> b!929303 (= res!625785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31590 () Bool)

(declare-fun tp!60584 () Bool)

(declare-fun e!521852 () Bool)

(assert (=> mapNonEmpty!31590 (= mapRes!31590 (and tp!60584 e!521852))))

(declare-fun mapKey!31590 () (_ BitVec 32))

(declare-datatypes ((V!31483 0))(
  ( (V!31484 (val!9995 Int)) )
))
(declare-datatypes ((ValueCell!9463 0))(
  ( (ValueCellFull!9463 (v!12513 V!31483)) (EmptyCell!9463) )
))
(declare-fun mapValue!31590 () ValueCell!9463)

(declare-fun mapRest!31590 () (Array (_ BitVec 32) ValueCell!9463))

(declare-datatypes ((array!55734 0))(
  ( (array!55735 (arr!26812 (Array (_ BitVec 32) ValueCell!9463)) (size!27271 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55734)

(assert (=> mapNonEmpty!31590 (= (arr!26812 _values!1231) (store mapRest!31590 mapKey!31590 mapValue!31590))))

(declare-fun res!625786 () Bool)

(assert (=> start!79168 (=> (not res!625786) (not e!521855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79168 (= res!625786 (validMask!0 mask!1881))))

(assert (=> start!79168 e!521855))

(assert (=> start!79168 true))

(declare-fun tp_is_empty!19889 () Bool)

(assert (=> start!79168 tp_is_empty!19889))

(declare-fun e!521853 () Bool)

(declare-fun array_inv!20864 (array!55734) Bool)

(assert (=> start!79168 (and (array_inv!20864 _values!1231) e!521853)))

(assert (=> start!79168 tp!60583))

(declare-fun array_inv!20865 (array!55732) Bool)

(assert (=> start!79168 (array_inv!20865 _keys!1487)))

(declare-fun b!929304 () Bool)

(declare-fun res!625787 () Bool)

(assert (=> b!929304 (=> (not res!625787) (not e!521855))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929304 (= res!625787 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27270 _keys!1487))))))

(declare-fun b!929305 () Bool)

(declare-fun e!521856 () Bool)

(assert (=> b!929305 (= e!521853 (and e!521856 mapRes!31590))))

(declare-fun condMapEmpty!31590 () Bool)

(declare-fun mapDefault!31590 () ValueCell!9463)

