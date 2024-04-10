; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83064 () Bool)

(assert start!83064)

(declare-fun b!969020 () Bool)

(declare-fun res!648631 () Bool)

(declare-fun e!546229 () Bool)

(assert (=> b!969020 (=> (not res!648631) (not e!546229))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34257 0))(
  ( (V!34258 (val!11028 Int)) )
))
(declare-datatypes ((ValueCell!10496 0))(
  ( (ValueCellFull!10496 (v!13587 V!34257)) (EmptyCell!10496) )
))
(declare-datatypes ((array!59983 0))(
  ( (array!59984 (arr!28855 (Array (_ BitVec 32) ValueCell!10496)) (size!29334 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59983)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59985 0))(
  ( (array!59986 (arr!28856 (Array (_ BitVec 32) (_ BitVec 64))) (size!29335 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59985)

(assert (=> b!969020 (= res!648631 (and (= (size!29334 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29335 _keys!1717) (size!29334 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969021 () Bool)

(assert (=> b!969021 (= e!546229 false)))

(declare-fun lt!431582 () Bool)

(declare-datatypes ((List!20011 0))(
  ( (Nil!20008) (Cons!20007 (h!21169 (_ BitVec 64)) (t!28374 List!20011)) )
))
(declare-fun arrayNoDuplicates!0 (array!59985 (_ BitVec 32) List!20011) Bool)

(assert (=> b!969021 (= lt!431582 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20008))))

(declare-fun mapIsEmpty!34942 () Bool)

(declare-fun mapRes!34942 () Bool)

(assert (=> mapIsEmpty!34942 mapRes!34942))

(declare-fun b!969022 () Bool)

(declare-fun res!648632 () Bool)

(assert (=> b!969022 (=> (not res!648632) (not e!546229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59985 (_ BitVec 32)) Bool)

(assert (=> b!969022 (= res!648632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!648633 () Bool)

(assert (=> start!83064 (=> (not res!648633) (not e!546229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83064 (= res!648633 (validMask!0 mask!2147))))

(assert (=> start!83064 e!546229))

(assert (=> start!83064 true))

(declare-fun e!546226 () Bool)

(declare-fun array_inv!22337 (array!59983) Bool)

(assert (=> start!83064 (and (array_inv!22337 _values!1425) e!546226)))

(declare-fun array_inv!22338 (array!59985) Bool)

(assert (=> start!83064 (array_inv!22338 _keys!1717)))

(declare-fun b!969023 () Bool)

(declare-fun e!546225 () Bool)

(declare-fun tp_is_empty!21955 () Bool)

(assert (=> b!969023 (= e!546225 tp_is_empty!21955)))

(declare-fun b!969024 () Bool)

(declare-fun e!546227 () Bool)

(assert (=> b!969024 (= e!546227 tp_is_empty!21955)))

(declare-fun b!969025 () Bool)

(assert (=> b!969025 (= e!546226 (and e!546227 mapRes!34942))))

(declare-fun condMapEmpty!34942 () Bool)

(declare-fun mapDefault!34942 () ValueCell!10496)

