; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100182 () Bool)

(assert start!100182)

(declare-fun b!1194685 () Bool)

(declare-fun res!794895 () Bool)

(declare-fun e!678941 () Bool)

(assert (=> b!1194685 (=> (not res!794895) (not e!678941))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77311 0))(
  ( (array!77312 (arr!37303 (Array (_ BitVec 32) (_ BitVec 64))) (size!37839 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77311)

(assert (=> b!1194685 (= res!794895 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37839 _keys!1208))))))

(declare-fun mapIsEmpty!47231 () Bool)

(declare-fun mapRes!47231 () Bool)

(assert (=> mapIsEmpty!47231 mapRes!47231))

(declare-fun b!1194686 () Bool)

(declare-fun e!678943 () Bool)

(assert (=> b!1194686 (= e!678941 e!678943)))

(declare-fun res!794898 () Bool)

(assert (=> b!1194686 (=> (not res!794898) (not e!678943))))

(declare-fun lt!542804 () array!77311)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77311 (_ BitVec 32)) Bool)

(assert (=> b!1194686 (= res!794898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542804 mask!1564))))

(assert (=> b!1194686 (= lt!542804 (array!77312 (store (arr!37303 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37839 _keys!1208)))))

(declare-fun b!1194687 () Bool)

(declare-fun e!678945 () Bool)

(declare-fun tp_is_empty!30265 () Bool)

(assert (=> b!1194687 (= e!678945 tp_is_empty!30265)))

(declare-fun mapNonEmpty!47231 () Bool)

(declare-fun tp!89841 () Bool)

(declare-fun e!678940 () Bool)

(assert (=> mapNonEmpty!47231 (= mapRes!47231 (and tp!89841 e!678940))))

(declare-datatypes ((V!45481 0))(
  ( (V!45482 (val!15189 Int)) )
))
(declare-datatypes ((ValueCell!14423 0))(
  ( (ValueCellFull!14423 (v!17827 V!45481)) (EmptyCell!14423) )
))
(declare-fun mapValue!47231 () ValueCell!14423)

(declare-datatypes ((array!77313 0))(
  ( (array!77314 (arr!37304 (Array (_ BitVec 32) ValueCell!14423)) (size!37840 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77313)

(declare-fun mapRest!47231 () (Array (_ BitVec 32) ValueCell!14423))

(declare-fun mapKey!47231 () (_ BitVec 32))

(assert (=> mapNonEmpty!47231 (= (arr!37304 _values!996) (store mapRest!47231 mapKey!47231 mapValue!47231))))

(declare-fun b!1194688 () Bool)

(declare-fun e!678944 () Bool)

(assert (=> b!1194688 (= e!678944 (and e!678945 mapRes!47231))))

(declare-fun condMapEmpty!47231 () Bool)

(declare-fun mapDefault!47231 () ValueCell!14423)

