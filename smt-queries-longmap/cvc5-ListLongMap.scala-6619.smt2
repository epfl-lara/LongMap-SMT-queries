; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83674 () Bool)

(assert start!83674)

(declare-fun mapIsEmpty!35759 () Bool)

(declare-fun mapRes!35759 () Bool)

(assert (=> mapIsEmpty!35759 mapRes!35759))

(declare-fun res!654066 () Bool)

(declare-fun e!550859 () Bool)

(assert (=> start!83674 (=> (not res!654066) (not e!550859))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83674 (= res!654066 (validMask!0 mask!1948))))

(assert (=> start!83674 e!550859))

(assert (=> start!83674 true))

(declare-datatypes ((V!34969 0))(
  ( (V!34970 (val!11295 Int)) )
))
(declare-datatypes ((ValueCell!10763 0))(
  ( (ValueCellFull!10763 (v!13856 V!34969)) (EmptyCell!10763) )
))
(declare-datatypes ((array!61011 0))(
  ( (array!61012 (arr!29364 (Array (_ BitVec 32) ValueCell!10763)) (size!29843 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61011)

(declare-fun e!550858 () Bool)

(declare-fun array_inv!22699 (array!61011) Bool)

(assert (=> start!83674 (and (array_inv!22699 _values!1278) e!550858)))

(declare-datatypes ((array!61013 0))(
  ( (array!61014 (arr!29365 (Array (_ BitVec 32) (_ BitVec 64))) (size!29844 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61013)

(declare-fun array_inv!22700 (array!61013) Bool)

(assert (=> start!83674 (array_inv!22700 _keys!1544)))

(declare-fun mapNonEmpty!35759 () Bool)

(declare-fun tp!68011 () Bool)

(declare-fun e!550861 () Bool)

(assert (=> mapNonEmpty!35759 (= mapRes!35759 (and tp!68011 e!550861))))

(declare-fun mapKey!35759 () (_ BitVec 32))

(declare-fun mapRest!35759 () (Array (_ BitVec 32) ValueCell!10763))

(declare-fun mapValue!35759 () ValueCell!10763)

(assert (=> mapNonEmpty!35759 (= (arr!29364 _values!1278) (store mapRest!35759 mapKey!35759 mapValue!35759))))

(declare-fun b!977229 () Bool)

(declare-fun e!550856 () Bool)

(declare-fun tp_is_empty!22489 () Bool)

(assert (=> b!977229 (= e!550856 tp_is_empty!22489)))

(declare-fun b!977230 () Bool)

(declare-fun res!654061 () Bool)

(assert (=> b!977230 (=> (not res!654061) (not e!550859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61013 (_ BitVec 32)) Bool)

(assert (=> b!977230 (= res!654061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977231 () Bool)

(declare-fun e!550860 () Bool)

(declare-datatypes ((List!20370 0))(
  ( (Nil!20367) (Cons!20366 (h!21528 (_ BitVec 64)) (t!28885 List!20370)) )
))
(declare-fun contains!5704 (List!20370 (_ BitVec 64)) Bool)

(assert (=> b!977231 (= e!550860 (contains!5704 Nil!20367 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977232 () Bool)

(assert (=> b!977232 (= e!550859 e!550860)))

(declare-fun res!654063 () Bool)

(assert (=> b!977232 (=> res!654063 e!550860)))

(assert (=> b!977232 (= res!654063 (contains!5704 Nil!20367 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977233 () Bool)

(assert (=> b!977233 (= e!550861 tp_is_empty!22489)))

(declare-fun b!977234 () Bool)

(declare-fun res!654062 () Bool)

(assert (=> b!977234 (=> (not res!654062) (not e!550859))))

(assert (=> b!977234 (= res!654062 (and (bvsle #b00000000000000000000000000000000 (size!29844 _keys!1544)) (bvslt (size!29844 _keys!1544) #b01111111111111111111111111111111)))))

(declare-fun b!977235 () Bool)

(declare-fun res!654064 () Bool)

(assert (=> b!977235 (=> (not res!654064) (not e!550859))))

(declare-fun noDuplicate!1376 (List!20370) Bool)

(assert (=> b!977235 (= res!654064 (noDuplicate!1376 Nil!20367))))

(declare-fun b!977236 () Bool)

(assert (=> b!977236 (= e!550858 (and e!550856 mapRes!35759))))

(declare-fun condMapEmpty!35759 () Bool)

(declare-fun mapDefault!35759 () ValueCell!10763)

