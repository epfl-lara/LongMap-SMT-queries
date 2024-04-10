; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99556 () Bool)

(assert start!99556)

(declare-fun b_free!25135 () Bool)

(declare-fun b_next!25135 () Bool)

(assert (=> start!99556 (= b_free!25135 (not b_next!25135))))

(declare-fun tp!88118 () Bool)

(declare-fun b_and!41137 () Bool)

(assert (=> start!99556 (= tp!88118 b_and!41137)))

(declare-fun b!1178230 () Bool)

(declare-fun e!669817 () Bool)

(declare-fun e!669809 () Bool)

(assert (=> b!1178230 (= e!669817 e!669809)))

(declare-fun res!782713 () Bool)

(assert (=> b!1178230 (=> (not res!782713) (not e!669809))))

(declare-datatypes ((array!76133 0))(
  ( (array!76134 (arr!36716 (Array (_ BitVec 32) (_ BitVec 64))) (size!37252 (_ BitVec 32))) )
))
(declare-fun lt!532208 () array!76133)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76133 (_ BitVec 32)) Bool)

(assert (=> b!1178230 (= res!782713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532208 mask!1564))))

(declare-fun _keys!1208 () array!76133)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1178230 (= lt!532208 (array!76134 (store (arr!36716 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37252 _keys!1208)))))

(declare-fun b!1178231 () Bool)

(declare-fun res!782707 () Bool)

(assert (=> b!1178231 (=> (not res!782707) (not e!669817))))

(assert (=> b!1178231 (= res!782707 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37252 _keys!1208))))))

(declare-fun b!1178232 () Bool)

(declare-fun res!782700 () Bool)

(assert (=> b!1178232 (=> (not res!782700) (not e!669809))))

(declare-datatypes ((List!25787 0))(
  ( (Nil!25784) (Cons!25783 (h!26992 (_ BitVec 64)) (t!37914 List!25787)) )
))
(declare-fun arrayNoDuplicates!0 (array!76133 (_ BitVec 32) List!25787) Bool)

(assert (=> b!1178232 (= res!782700 (arrayNoDuplicates!0 lt!532208 #b00000000000000000000000000000000 Nil!25784))))

(declare-fun b!1178233 () Bool)

(declare-fun e!669818 () Bool)

(declare-fun tp_is_empty!29665 () Bool)

(assert (=> b!1178233 (= e!669818 tp_is_empty!29665)))

(declare-fun mapIsEmpty!46325 () Bool)

(declare-fun mapRes!46325 () Bool)

(assert (=> mapIsEmpty!46325 mapRes!46325))

(declare-fun b!1178234 () Bool)

(declare-fun res!782708 () Bool)

(assert (=> b!1178234 (=> (not res!782708) (not e!669817))))

(assert (=> b!1178234 (= res!782708 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25784))))

(declare-fun b!1178235 () Bool)

(declare-fun res!782705 () Bool)

(assert (=> b!1178235 (=> (not res!782705) (not e!669817))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44681 0))(
  ( (V!44682 (val!14889 Int)) )
))
(declare-datatypes ((ValueCell!14123 0))(
  ( (ValueCellFull!14123 (v!17527 V!44681)) (EmptyCell!14123) )
))
(declare-datatypes ((array!76135 0))(
  ( (array!76136 (arr!36717 (Array (_ BitVec 32) ValueCell!14123)) (size!37253 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76135)

(assert (=> b!1178235 (= res!782705 (and (= (size!37253 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37252 _keys!1208) (size!37253 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178236 () Bool)

(declare-fun res!782706 () Bool)

(assert (=> b!1178236 (=> (not res!782706) (not e!669817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178236 (= res!782706 (validMask!0 mask!1564))))

(declare-fun b!1178237 () Bool)

(declare-fun e!669808 () Bool)

(declare-fun e!669820 () Bool)

(assert (=> b!1178237 (= e!669808 (and e!669820 mapRes!46325))))

(declare-fun condMapEmpty!46325 () Bool)

(declare-fun mapDefault!46325 () ValueCell!14123)

