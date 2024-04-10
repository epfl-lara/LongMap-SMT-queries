; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20952 () Bool)

(assert start!20952)

(declare-fun b_free!5545 () Bool)

(declare-fun b_next!5545 () Bool)

(assert (=> start!20952 (= b_free!5545 (not b_next!5545))))

(declare-fun tp!19684 () Bool)

(declare-fun b_and!12327 () Bool)

(assert (=> start!20952 (= tp!19684 b_and!12327)))

(declare-fun b!210481 () Bool)

(declare-fun res!102696 () Bool)

(declare-fun e!137063 () Bool)

(assert (=> b!210481 (=> (not res!102696) (not e!137063))))

(declare-datatypes ((array!10015 0))(
  ( (array!10016 (arr!4755 (Array (_ BitVec 32) (_ BitVec 64))) (size!5080 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10015)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6857 0))(
  ( (V!6858 (val!2748 Int)) )
))
(declare-datatypes ((ValueCell!2360 0))(
  ( (ValueCellFull!2360 (v!4730 V!6857)) (EmptyCell!2360) )
))
(declare-datatypes ((array!10017 0))(
  ( (array!10018 (arr!4756 (Array (_ BitVec 32) ValueCell!2360)) (size!5081 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10017)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!210481 (= res!102696 (and (= (size!5081 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5080 _keys!825) (size!5081 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!102693 () Bool)

(assert (=> start!20952 (=> (not res!102693) (not e!137063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20952 (= res!102693 (validMask!0 mask!1149))))

(assert (=> start!20952 e!137063))

(declare-fun e!137064 () Bool)

(declare-fun array_inv!3147 (array!10017) Bool)

(assert (=> start!20952 (and (array_inv!3147 _values!649) e!137064)))

(assert (=> start!20952 true))

(declare-fun tp_is_empty!5407 () Bool)

(assert (=> start!20952 tp_is_empty!5407))

(declare-fun array_inv!3148 (array!10015) Bool)

(assert (=> start!20952 (array_inv!3148 _keys!825)))

(assert (=> start!20952 tp!19684))

(declare-fun b!210482 () Bool)

(declare-fun res!102700 () Bool)

(assert (=> b!210482 (=> (not res!102700) (not e!137063))))

(declare-datatypes ((List!3048 0))(
  ( (Nil!3045) (Cons!3044 (h!3686 (_ BitVec 64)) (t!7985 List!3048)) )
))
(declare-fun arrayNoDuplicates!0 (array!10015 (_ BitVec 32) List!3048) Bool)

(assert (=> b!210482 (= res!102700 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3045))))

(declare-fun b!210483 () Bool)

(declare-fun res!102695 () Bool)

(assert (=> b!210483 (=> (not res!102695) (not e!137063))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210483 (= res!102695 (= (select (arr!4755 _keys!825) i!601) k!843))))

(declare-fun b!210484 () Bool)

(declare-fun res!102697 () Bool)

(assert (=> b!210484 (=> (not res!102697) (not e!137063))))

(assert (=> b!210484 (= res!102697 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5080 _keys!825))))))

(declare-fun b!210485 () Bool)

(declare-fun e!137061 () Bool)

(assert (=> b!210485 (= e!137061 tp_is_empty!5407)))

(declare-fun b!210486 () Bool)

(declare-fun res!102699 () Bool)

(assert (=> b!210486 (=> (not res!102699) (not e!137063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210486 (= res!102699 (validKeyInArray!0 k!843))))

(declare-fun b!210487 () Bool)

(declare-fun res!102694 () Bool)

(assert (=> b!210487 (=> (not res!102694) (not e!137063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10015 (_ BitVec 32)) Bool)

(assert (=> b!210487 (= res!102694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210488 () Bool)

(declare-fun e!137062 () Bool)

(assert (=> b!210488 (= e!137062 tp_is_empty!5407)))

(declare-fun b!210489 () Bool)

(declare-fun mapRes!9188 () Bool)

(assert (=> b!210489 (= e!137064 (and e!137062 mapRes!9188))))

(declare-fun condMapEmpty!9188 () Bool)

(declare-fun mapDefault!9188 () ValueCell!2360)

