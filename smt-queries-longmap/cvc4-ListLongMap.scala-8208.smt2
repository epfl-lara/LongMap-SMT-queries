; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100118 () Bool)

(assert start!100118)

(declare-fun b!1193893 () Bool)

(declare-fun e!678534 () Bool)

(declare-fun tp_is_empty!30227 () Bool)

(assert (=> b!1193893 (= e!678534 tp_is_empty!30227)))

(declare-fun b!1193894 () Bool)

(declare-fun res!794319 () Bool)

(declare-fun e!678536 () Bool)

(assert (=> b!1193894 (=> (not res!794319) (not e!678536))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193894 (= res!794319 (validMask!0 mask!1564))))

(declare-fun b!1193895 () Bool)

(declare-fun res!794317 () Bool)

(assert (=> b!1193895 (=> (not res!794317) (not e!678536))))

(declare-datatypes ((array!77233 0))(
  ( (array!77234 (arr!37266 (Array (_ BitVec 32) (_ BitVec 64))) (size!37802 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77233)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77233 (_ BitVec 32)) Bool)

(assert (=> b!1193895 (= res!794317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193896 () Bool)

(declare-fun res!794318 () Bool)

(assert (=> b!1193896 (=> (not res!794318) (not e!678536))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45429 0))(
  ( (V!45430 (val!15170 Int)) )
))
(declare-datatypes ((ValueCell!14404 0))(
  ( (ValueCellFull!14404 (v!17808 V!45429)) (EmptyCell!14404) )
))
(declare-datatypes ((array!77235 0))(
  ( (array!77236 (arr!37267 (Array (_ BitVec 32) ValueCell!14404)) (size!37803 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77235)

(assert (=> b!1193896 (= res!794318 (and (= (size!37803 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37802 _keys!1208) (size!37803 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193897 () Bool)

(declare-fun e!678537 () Bool)

(assert (=> b!1193897 (= e!678537 tp_is_empty!30227)))

(declare-fun b!1193898 () Bool)

(assert (=> b!1193898 (= e!678536 false)))

(declare-fun lt!542694 () Bool)

(declare-datatypes ((List!26248 0))(
  ( (Nil!26245) (Cons!26244 (h!27453 (_ BitVec 64)) (t!38919 List!26248)) )
))
(declare-fun arrayNoDuplicates!0 (array!77233 (_ BitVec 32) List!26248) Bool)

(assert (=> b!1193898 (= lt!542694 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26245))))

(declare-fun mapNonEmpty!47168 () Bool)

(declare-fun mapRes!47168 () Bool)

(declare-fun tp!89778 () Bool)

(assert (=> mapNonEmpty!47168 (= mapRes!47168 (and tp!89778 e!678537))))

(declare-fun mapKey!47168 () (_ BitVec 32))

(declare-fun mapRest!47168 () (Array (_ BitVec 32) ValueCell!14404))

(declare-fun mapValue!47168 () ValueCell!14404)

(assert (=> mapNonEmpty!47168 (= (arr!37267 _values!996) (store mapRest!47168 mapKey!47168 mapValue!47168))))

(declare-fun mapIsEmpty!47168 () Bool)

(assert (=> mapIsEmpty!47168 mapRes!47168))

(declare-fun b!1193892 () Bool)

(declare-fun e!678535 () Bool)

(assert (=> b!1193892 (= e!678535 (and e!678534 mapRes!47168))))

(declare-fun condMapEmpty!47168 () Bool)

(declare-fun mapDefault!47168 () ValueCell!14404)

