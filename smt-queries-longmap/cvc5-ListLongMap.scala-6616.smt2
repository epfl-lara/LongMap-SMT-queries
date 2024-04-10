; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83630 () Bool)

(assert start!83630)

(declare-fun res!653943 () Bool)

(declare-fun e!550672 () Bool)

(assert (=> start!83630 (=> (not res!653943) (not e!550672))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83630 (= res!653943 (validMask!0 mask!1948))))

(assert (=> start!83630 e!550672))

(assert (=> start!83630 true))

(declare-datatypes ((V!34945 0))(
  ( (V!34946 (val!11286 Int)) )
))
(declare-datatypes ((ValueCell!10754 0))(
  ( (ValueCellFull!10754 (v!13847 V!34945)) (EmptyCell!10754) )
))
(declare-datatypes ((array!60969 0))(
  ( (array!60970 (arr!29346 (Array (_ BitVec 32) ValueCell!10754)) (size!29825 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60969)

(declare-fun e!550670 () Bool)

(declare-fun array_inv!22687 (array!60969) Bool)

(assert (=> start!83630 (and (array_inv!22687 _values!1278) e!550670)))

(declare-datatypes ((array!60971 0))(
  ( (array!60972 (arr!29347 (Array (_ BitVec 32) (_ BitVec 64))) (size!29826 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60971)

(declare-fun array_inv!22688 (array!60971) Bool)

(assert (=> start!83630 (array_inv!22688 _keys!1544)))

(declare-fun b!976986 () Bool)

(declare-fun e!550671 () Bool)

(declare-fun tp_is_empty!22471 () Bool)

(assert (=> b!976986 (= e!550671 tp_is_empty!22471)))

(declare-fun b!976987 () Bool)

(declare-fun res!653942 () Bool)

(assert (=> b!976987 (=> (not res!653942) (not e!550672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60971 (_ BitVec 32)) Bool)

(assert (=> b!976987 (= res!653942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!976988 () Bool)

(declare-fun e!550668 () Bool)

(assert (=> b!976988 (= e!550668 tp_is_empty!22471)))

(declare-fun b!976989 () Bool)

(declare-fun res!653941 () Bool)

(assert (=> b!976989 (=> (not res!653941) (not e!550672))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!976989 (= res!653941 (and (= (size!29825 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29826 _keys!1544) (size!29825 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!976990 () Bool)

(declare-fun mapRes!35723 () Bool)

(assert (=> b!976990 (= e!550670 (and e!550668 mapRes!35723))))

(declare-fun condMapEmpty!35723 () Bool)

(declare-fun mapDefault!35723 () ValueCell!10754)

