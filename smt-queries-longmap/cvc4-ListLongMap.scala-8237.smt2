; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100356 () Bool)

(assert start!100356)

(declare-fun b!1197683 () Bool)

(declare-fun res!797057 () Bool)

(declare-fun e!680386 () Bool)

(assert (=> b!1197683 (=> (not res!797057) (not e!680386))))

(declare-datatypes ((array!77579 0))(
  ( (array!77580 (arr!37435 (Array (_ BitVec 32) (_ BitVec 64))) (size!37971 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77579)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1197683 (= res!797057 (= (select (arr!37435 _keys!1208) i!673) k!934))))

(declare-fun b!1197684 () Bool)

(declare-fun e!680383 () Bool)

(assert (=> b!1197684 (= e!680383 (not true))))

(declare-fun arrayContainsKey!0 (array!77579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197684 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39710 0))(
  ( (Unit!39711) )
))
(declare-fun lt!543335 () Unit!39710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77579 (_ BitVec 64) (_ BitVec 32)) Unit!39710)

(assert (=> b!1197684 (= lt!543335 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1197685 () Bool)

(declare-fun e!680387 () Bool)

(declare-fun tp_is_empty!30401 () Bool)

(assert (=> b!1197685 (= e!680387 tp_is_empty!30401)))

(declare-fun b!1197686 () Bool)

(declare-fun res!797056 () Bool)

(assert (=> b!1197686 (=> (not res!797056) (not e!680386))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77579 (_ BitVec 32)) Bool)

(assert (=> b!1197686 (= res!797056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197687 () Bool)

(declare-fun res!797055 () Bool)

(assert (=> b!1197687 (=> (not res!797055) (not e!680386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197687 (= res!797055 (validMask!0 mask!1564))))

(declare-fun b!1197688 () Bool)

(declare-fun res!797058 () Bool)

(assert (=> b!1197688 (=> (not res!797058) (not e!680386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197688 (= res!797058 (validKeyInArray!0 k!934))))

(declare-fun b!1197689 () Bool)

(declare-fun e!680384 () Bool)

(assert (=> b!1197689 (= e!680384 tp_is_empty!30401)))

(declare-fun b!1197690 () Bool)

(declare-fun res!797062 () Bool)

(assert (=> b!1197690 (=> (not res!797062) (not e!680386))))

(assert (=> b!1197690 (= res!797062 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37971 _keys!1208))))))

(declare-fun b!1197691 () Bool)

(declare-fun res!797059 () Bool)

(assert (=> b!1197691 (=> (not res!797059) (not e!680386))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45661 0))(
  ( (V!45662 (val!15257 Int)) )
))
(declare-datatypes ((ValueCell!14491 0))(
  ( (ValueCellFull!14491 (v!17895 V!45661)) (EmptyCell!14491) )
))
(declare-datatypes ((array!77581 0))(
  ( (array!77582 (arr!37436 (Array (_ BitVec 32) ValueCell!14491)) (size!37972 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77581)

(assert (=> b!1197691 (= res!797059 (and (= (size!37972 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37971 _keys!1208) (size!37972 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197692 () Bool)

(declare-fun e!680382 () Bool)

(declare-fun mapRes!47441 () Bool)

(assert (=> b!1197692 (= e!680382 (and e!680384 mapRes!47441))))

(declare-fun condMapEmpty!47441 () Bool)

(declare-fun mapDefault!47441 () ValueCell!14491)

