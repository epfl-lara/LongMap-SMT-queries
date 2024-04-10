; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77536 () Bool)

(assert start!77536)

(declare-fun b_free!16121 () Bool)

(declare-fun b_next!16121 () Bool)

(assert (=> start!77536 (= b_free!16121 (not b_next!16121))))

(declare-fun tp!56624 () Bool)

(declare-fun b_and!26487 () Bool)

(assert (=> start!77536 (= tp!56624 b_and!26487)))

(declare-fun b!903404 () Bool)

(declare-fun e!506159 () Bool)

(declare-fun tp_is_empty!18539 () Bool)

(assert (=> b!903404 (= e!506159 tp_is_empty!18539)))

(declare-fun mapIsEmpty!29521 () Bool)

(declare-fun mapRes!29521 () Bool)

(assert (=> mapIsEmpty!29521 mapRes!29521))

(declare-fun b!903405 () Bool)

(declare-fun e!506158 () Bool)

(assert (=> b!903405 (= e!506158 tp_is_empty!18539)))

(declare-fun mapNonEmpty!29521 () Bool)

(declare-fun tp!56625 () Bool)

(assert (=> mapNonEmpty!29521 (= mapRes!29521 (and tp!56625 e!506158))))

(declare-fun mapKey!29521 () (_ BitVec 32))

(declare-datatypes ((V!29683 0))(
  ( (V!29684 (val!9320 Int)) )
))
(declare-datatypes ((ValueCell!8788 0))(
  ( (ValueCellFull!8788 (v!11825 V!29683)) (EmptyCell!8788) )
))
(declare-fun mapRest!29521 () (Array (_ BitVec 32) ValueCell!8788))

(declare-fun mapValue!29521 () ValueCell!8788)

(declare-datatypes ((array!53134 0))(
  ( (array!53135 (arr!25526 (Array (_ BitVec 32) ValueCell!8788)) (size!25985 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53134)

(assert (=> mapNonEmpty!29521 (= (arr!25526 _values!1152) (store mapRest!29521 mapKey!29521 mapValue!29521))))

(declare-fun res!609521 () Bool)

(declare-fun e!506156 () Bool)

(assert (=> start!77536 (=> (not res!609521) (not e!506156))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77536 (= res!609521 (validMask!0 mask!1756))))

(assert (=> start!77536 e!506156))

(declare-fun e!506160 () Bool)

(declare-fun array_inv!20004 (array!53134) Bool)

(assert (=> start!77536 (and (array_inv!20004 _values!1152) e!506160)))

(assert (=> start!77536 tp!56624))

(assert (=> start!77536 true))

(assert (=> start!77536 tp_is_empty!18539))

(declare-datatypes ((array!53136 0))(
  ( (array!53137 (arr!25527 (Array (_ BitVec 32) (_ BitVec 64))) (size!25986 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53136)

(declare-fun array_inv!20005 (array!53136) Bool)

(assert (=> start!77536 (array_inv!20005 _keys!1386)))

(declare-fun b!903406 () Bool)

(declare-fun res!609522 () Bool)

(assert (=> b!903406 (=> (not res!609522) (not e!506156))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903406 (= res!609522 (and (= (size!25985 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25986 _keys!1386) (size!25985 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903407 () Bool)

(declare-fun res!609523 () Bool)

(assert (=> b!903407 (=> (not res!609523) (not e!506156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53136 (_ BitVec 32)) Bool)

(assert (=> b!903407 (= res!609523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903408 () Bool)

(assert (=> b!903408 (= e!506160 (and e!506159 mapRes!29521))))

(declare-fun condMapEmpty!29521 () Bool)

(declare-fun mapDefault!29521 () ValueCell!8788)

