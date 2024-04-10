; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41386 () Bool)

(assert start!41386)

(declare-fun b!462545 () Bool)

(declare-fun res!276620 () Bool)

(declare-fun e!269936 () Bool)

(assert (=> b!462545 (=> (not res!276620) (not e!269936))))

(declare-datatypes ((array!28805 0))(
  ( (array!28806 (arr!13836 (Array (_ BitVec 32) (_ BitVec 64))) (size!14188 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28805)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28805 (_ BitVec 32)) Bool)

(assert (=> b!462545 (= res!276620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!276619 () Bool)

(assert (=> start!41386 (=> (not res!276619) (not e!269936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41386 (= res!276619 (validMask!0 mask!1365))))

(assert (=> start!41386 e!269936))

(assert (=> start!41386 true))

(declare-fun array_inv!10004 (array!28805) Bool)

(assert (=> start!41386 (array_inv!10004 _keys!1025)))

(declare-datatypes ((V!17775 0))(
  ( (V!17776 (val!6296 Int)) )
))
(declare-datatypes ((ValueCell!5908 0))(
  ( (ValueCellFull!5908 (v!8583 V!17775)) (EmptyCell!5908) )
))
(declare-datatypes ((array!28807 0))(
  ( (array!28808 (arr!13837 (Array (_ BitVec 32) ValueCell!5908)) (size!14189 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28807)

(declare-fun e!269933 () Bool)

(declare-fun array_inv!10005 (array!28807) Bool)

(assert (=> start!41386 (and (array_inv!10005 _values!833) e!269933)))

(declare-fun mapNonEmpty!20425 () Bool)

(declare-fun mapRes!20425 () Bool)

(declare-fun tp!39244 () Bool)

(declare-fun e!269937 () Bool)

(assert (=> mapNonEmpty!20425 (= mapRes!20425 (and tp!39244 e!269937))))

(declare-fun mapRest!20425 () (Array (_ BitVec 32) ValueCell!5908))

(declare-fun mapValue!20425 () ValueCell!5908)

(declare-fun mapKey!20425 () (_ BitVec 32))

(assert (=> mapNonEmpty!20425 (= (arr!13837 _values!833) (store mapRest!20425 mapKey!20425 mapValue!20425))))

(declare-fun b!462546 () Bool)

(declare-fun e!269934 () Bool)

(assert (=> b!462546 (= e!269933 (and e!269934 mapRes!20425))))

(declare-fun condMapEmpty!20425 () Bool)

(declare-fun mapDefault!20425 () ValueCell!5908)

