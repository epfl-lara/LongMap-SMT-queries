; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20166 () Bool)

(assert start!20166)

(declare-fun b_free!4825 () Bool)

(declare-fun b_next!4825 () Bool)

(assert (=> start!20166 (= b_free!4825 (not b_next!4825))))

(declare-fun tp!17507 () Bool)

(declare-fun b_and!11571 () Bool)

(assert (=> start!20166 (= tp!17507 b_and!11571)))

(declare-fun b!197924 () Bool)

(declare-fun res!93733 () Bool)

(declare-fun e!130168 () Bool)

(assert (=> b!197924 (=> (not res!93733) (not e!130168))))

(declare-datatypes ((array!8613 0))(
  ( (array!8614 (arr!4057 (Array (_ BitVec 32) (_ BitVec 64))) (size!4382 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8613)

(declare-datatypes ((V!5889 0))(
  ( (V!5890 (val!2385 Int)) )
))
(declare-datatypes ((ValueCell!1997 0))(
  ( (ValueCellFull!1997 (v!4355 V!5889)) (EmptyCell!1997) )
))
(declare-datatypes ((array!8615 0))(
  ( (array!8616 (arr!4058 (Array (_ BitVec 32) ValueCell!1997)) (size!4383 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8615)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197924 (= res!93733 (and (= (size!4383 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4382 _keys!825) (size!4383 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197925 () Bool)

(declare-fun res!93732 () Bool)

(assert (=> b!197925 (=> (not res!93732) (not e!130168))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197925 (= res!93732 (= (select (arr!4057 _keys!825) i!601) k!843))))

(declare-fun b!197926 () Bool)

(declare-fun res!93730 () Bool)

(assert (=> b!197926 (=> (not res!93730) (not e!130168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197926 (= res!93730 (validKeyInArray!0 k!843))))

(declare-fun b!197927 () Bool)

(declare-fun res!93727 () Bool)

(assert (=> b!197927 (=> (not res!93727) (not e!130168))))

(declare-datatypes ((List!2533 0))(
  ( (Nil!2530) (Cons!2529 (h!3171 (_ BitVec 64)) (t!7464 List!2533)) )
))
(declare-fun arrayNoDuplicates!0 (array!8613 (_ BitVec 32) List!2533) Bool)

(assert (=> b!197927 (= res!93727 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2530))))

(declare-fun b!197928 () Bool)

(declare-fun e!130167 () Bool)

(declare-fun tp_is_empty!4681 () Bool)

(assert (=> b!197928 (= e!130167 tp_is_empty!4681)))

(declare-fun b!197929 () Bool)

(declare-fun e!130169 () Bool)

(assert (=> b!197929 (= e!130169 tp_is_empty!4681)))

(declare-fun res!93729 () Bool)

(assert (=> start!20166 (=> (not res!93729) (not e!130168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20166 (= res!93729 (validMask!0 mask!1149))))

(assert (=> start!20166 e!130168))

(declare-fun e!130165 () Bool)

(declare-fun array_inv!2651 (array!8615) Bool)

(assert (=> start!20166 (and (array_inv!2651 _values!649) e!130165)))

(assert (=> start!20166 true))

(assert (=> start!20166 tp_is_empty!4681))

(declare-fun array_inv!2652 (array!8613) Bool)

(assert (=> start!20166 (array_inv!2652 _keys!825)))

(assert (=> start!20166 tp!17507))

(declare-fun b!197930 () Bool)

(declare-fun mapRes!8090 () Bool)

(assert (=> b!197930 (= e!130165 (and e!130167 mapRes!8090))))

(declare-fun condMapEmpty!8090 () Bool)

(declare-fun mapDefault!8090 () ValueCell!1997)

