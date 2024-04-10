; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100352 () Bool)

(assert start!100352)

(declare-fun b!1197605 () Bool)

(declare-fun res!796999 () Bool)

(declare-fun e!680351 () Bool)

(assert (=> b!1197605 (=> (not res!796999) (not e!680351))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197605 (= res!796999 (validKeyInArray!0 k!934))))

(declare-fun b!1197606 () Bool)

(declare-fun e!680347 () Bool)

(declare-fun tp_is_empty!30397 () Bool)

(assert (=> b!1197606 (= e!680347 tp_is_empty!30397)))

(declare-fun mapNonEmpty!47435 () Bool)

(declare-fun mapRes!47435 () Bool)

(declare-fun tp!90090 () Bool)

(assert (=> mapNonEmpty!47435 (= mapRes!47435 (and tp!90090 e!680347))))

(declare-fun mapKey!47435 () (_ BitVec 32))

(declare-datatypes ((V!45657 0))(
  ( (V!45658 (val!15255 Int)) )
))
(declare-datatypes ((ValueCell!14489 0))(
  ( (ValueCellFull!14489 (v!17893 V!45657)) (EmptyCell!14489) )
))
(declare-fun mapRest!47435 () (Array (_ BitVec 32) ValueCell!14489))

(declare-datatypes ((array!77571 0))(
  ( (array!77572 (arr!37431 (Array (_ BitVec 32) ValueCell!14489)) (size!37967 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77571)

(declare-fun mapValue!47435 () ValueCell!14489)

(assert (=> mapNonEmpty!47435 (= (arr!37431 _values!996) (store mapRest!47435 mapKey!47435 mapValue!47435))))

(declare-fun b!1197607 () Bool)

(declare-fun e!680346 () Bool)

(assert (=> b!1197607 (= e!680346 tp_is_empty!30397)))

(declare-fun b!1197608 () Bool)

(declare-fun res!797001 () Bool)

(declare-fun e!680350 () Bool)

(assert (=> b!1197608 (=> (not res!797001) (not e!680350))))

(declare-datatypes ((array!77573 0))(
  ( (array!77574 (arr!37432 (Array (_ BitVec 32) (_ BitVec 64))) (size!37968 (_ BitVec 32))) )
))
(declare-fun lt!543323 () array!77573)

(declare-datatypes ((List!26336 0))(
  ( (Nil!26333) (Cons!26332 (h!27541 (_ BitVec 64)) (t!39037 List!26336)) )
))
(declare-fun arrayNoDuplicates!0 (array!77573 (_ BitVec 32) List!26336) Bool)

(assert (=> b!1197608 (= res!797001 (arrayNoDuplicates!0 lt!543323 #b00000000000000000000000000000000 Nil!26333))))

(declare-fun b!1197609 () Bool)

(declare-fun res!796997 () Bool)

(assert (=> b!1197609 (=> (not res!796997) (not e!680351))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197609 (= res!796997 (validMask!0 mask!1564))))

(declare-fun res!796998 () Bool)

(assert (=> start!100352 (=> (not res!796998) (not e!680351))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!77573)

(assert (=> start!100352 (= res!796998 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37968 _keys!1208))))))

(assert (=> start!100352 e!680351))

(declare-fun array_inv!28528 (array!77573) Bool)

(assert (=> start!100352 (array_inv!28528 _keys!1208)))

(assert (=> start!100352 true))

(declare-fun e!680348 () Bool)

(declare-fun array_inv!28529 (array!77571) Bool)

(assert (=> start!100352 (and (array_inv!28529 _values!996) e!680348)))

(declare-fun b!1197610 () Bool)

(declare-fun res!797004 () Bool)

(assert (=> b!1197610 (=> (not res!797004) (not e!680351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77573 (_ BitVec 32)) Bool)

(assert (=> b!1197610 (= res!797004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197611 () Bool)

(assert (=> b!1197611 (= e!680350 (not true))))

(declare-fun arrayContainsKey!0 (array!77573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197611 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39706 0))(
  ( (Unit!39707) )
))
(declare-fun lt!543324 () Unit!39706)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77573 (_ BitVec 64) (_ BitVec 32)) Unit!39706)

(assert (=> b!1197611 (= lt!543324 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1197612 () Bool)

(declare-fun res!796995 () Bool)

(assert (=> b!1197612 (=> (not res!796995) (not e!680351))))

(assert (=> b!1197612 (= res!796995 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26333))))

(declare-fun b!1197613 () Bool)

(declare-fun res!797000 () Bool)

(assert (=> b!1197613 (=> (not res!797000) (not e!680351))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1197613 (= res!797000 (and (= (size!37967 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37968 _keys!1208) (size!37967 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47435 () Bool)

(assert (=> mapIsEmpty!47435 mapRes!47435))

(declare-fun b!1197614 () Bool)

(assert (=> b!1197614 (= e!680348 (and e!680346 mapRes!47435))))

(declare-fun condMapEmpty!47435 () Bool)

(declare-fun mapDefault!47435 () ValueCell!14489)

