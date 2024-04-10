; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83704 () Bool)

(assert start!83704)

(declare-fun mapNonEmpty!35789 () Bool)

(declare-fun mapRes!35789 () Bool)

(declare-fun tp!68041 () Bool)

(declare-fun e!551029 () Bool)

(assert (=> mapNonEmpty!35789 (= mapRes!35789 (and tp!68041 e!551029))))

(declare-datatypes ((V!34993 0))(
  ( (V!34994 (val!11304 Int)) )
))
(declare-datatypes ((ValueCell!10772 0))(
  ( (ValueCellFull!10772 (v!13866 V!34993)) (EmptyCell!10772) )
))
(declare-datatypes ((array!61047 0))(
  ( (array!61048 (arr!29381 (Array (_ BitVec 32) ValueCell!10772)) (size!29860 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61047)

(declare-fun mapValue!35789 () ValueCell!10772)

(declare-fun mapRest!35789 () (Array (_ BitVec 32) ValueCell!10772))

(declare-fun mapKey!35789 () (_ BitVec 32))

(assert (=> mapNonEmpty!35789 (= (arr!29381 _values!1278) (store mapRest!35789 mapKey!35789 mapValue!35789))))

(declare-fun b!977446 () Bool)

(declare-fun res!654184 () Bool)

(declare-fun e!551031 () Bool)

(assert (=> b!977446 (=> (not res!654184) (not e!551031))))

(declare-datatypes ((array!61049 0))(
  ( (array!61050 (arr!29382 (Array (_ BitVec 32) (_ BitVec 64))) (size!29861 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61049)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61049 (_ BitVec 32)) Bool)

(assert (=> b!977446 (= res!654184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977447 () Bool)

(declare-fun res!654185 () Bool)

(assert (=> b!977447 (=> (not res!654185) (not e!551031))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977447 (= res!654185 (and (= (size!29860 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29861 _keys!1544) (size!29860 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977448 () Bool)

(declare-fun tp_is_empty!22507 () Bool)

(assert (=> b!977448 (= e!551029 tp_is_empty!22507)))

(declare-fun res!654183 () Bool)

(assert (=> start!83704 (=> (not res!654183) (not e!551031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83704 (= res!654183 (validMask!0 mask!1948))))

(assert (=> start!83704 e!551031))

(assert (=> start!83704 true))

(declare-fun e!551028 () Bool)

(declare-fun array_inv!22715 (array!61047) Bool)

(assert (=> start!83704 (and (array_inv!22715 _values!1278) e!551028)))

(declare-fun array_inv!22716 (array!61049) Bool)

(assert (=> start!83704 (array_inv!22716 _keys!1544)))

(declare-fun b!977449 () Bool)

(declare-fun e!551030 () Bool)

(assert (=> b!977449 (= e!551030 tp_is_empty!22507)))

(declare-fun mapIsEmpty!35789 () Bool)

(assert (=> mapIsEmpty!35789 mapRes!35789))

(declare-fun b!977450 () Bool)

(assert (=> b!977450 (= e!551028 (and e!551030 mapRes!35789))))

(declare-fun condMapEmpty!35789 () Bool)

(declare-fun mapDefault!35789 () ValueCell!10772)

