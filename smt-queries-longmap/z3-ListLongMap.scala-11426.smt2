; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133222 () Bool)

(assert start!133222)

(declare-fun b!1558377 () Bool)

(declare-fun res!1065823 () Bool)

(declare-fun e!868133 () Bool)

(assert (=> b!1558377 (=> (not res!1065823) (not e!868133))))

(declare-datatypes ((B!2434 0))(
  ( (B!2435 (val!19303 Int)) )
))
(declare-datatypes ((tuple2!24982 0))(
  ( (tuple2!24983 (_1!12502 (_ BitVec 64)) (_2!12502 B!2434)) )
))
(declare-datatypes ((List!36337 0))(
  ( (Nil!36334) (Cons!36333 (h!37779 tuple2!24982) (t!51064 List!36337)) )
))
(declare-fun l!1292 () List!36337)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!840 (List!36337 (_ BitVec 64)) Bool)

(assert (=> b!1558377 (= res!1065823 (containsKey!840 (t!51064 l!1292) otherKey!62))))

(declare-fun b!1558378 () Bool)

(declare-fun res!1065822 () Bool)

(assert (=> b!1558378 (=> (not res!1065822) (not e!868133))))

(declare-fun isStrictlySorted!977 (List!36337) Bool)

(assert (=> b!1558378 (= res!1065822 (isStrictlySorted!977 (t!51064 l!1292)))))

(declare-fun res!1065826 () Bool)

(assert (=> start!133222 (=> (not res!1065826) (not e!868133))))

(assert (=> start!133222 (= res!1065826 (isStrictlySorted!977 l!1292))))

(assert (=> start!133222 e!868133))

(declare-fun e!868132 () Bool)

(assert (=> start!133222 e!868132))

(assert (=> start!133222 true))

(declare-fun b!1558379 () Bool)

(declare-fun tp_is_empty!38439 () Bool)

(declare-fun tp!112641 () Bool)

(assert (=> b!1558379 (= e!868132 (and tp_is_empty!38439 tp!112641))))

(declare-fun b!1558380 () Bool)

(declare-fun res!1065824 () Bool)

(assert (=> b!1558380 (=> (not res!1065824) (not e!868133))))

(declare-fun newKey!135 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1558380 (= res!1065824 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36333) l!1292) (not (= (_1!12502 (h!37779 l!1292)) otherKey!62))))))

(declare-fun b!1558381 () Bool)

(declare-fun ListPrimitiveSize!185 (List!36337) Int)

(assert (=> b!1558381 (= e!868133 (>= (ListPrimitiveSize!185 (t!51064 l!1292)) (ListPrimitiveSize!185 l!1292)))))

(declare-fun b!1558382 () Bool)

(declare-fun res!1065825 () Bool)

(assert (=> b!1558382 (=> (not res!1065825) (not e!868133))))

(assert (=> b!1558382 (= res!1065825 (containsKey!840 l!1292 otherKey!62))))

(assert (= (and start!133222 res!1065826) b!1558382))

(assert (= (and b!1558382 res!1065825) b!1558380))

(assert (= (and b!1558380 res!1065824) b!1558378))

(assert (= (and b!1558378 res!1065822) b!1558377))

(assert (= (and b!1558377 res!1065823) b!1558381))

(assert (= (and start!133222 ((_ is Cons!36333) l!1292)) b!1558379))

(declare-fun m!1435053 () Bool)

(assert (=> start!133222 m!1435053))

(declare-fun m!1435055 () Bool)

(assert (=> b!1558381 m!1435055))

(declare-fun m!1435057 () Bool)

(assert (=> b!1558381 m!1435057))

(declare-fun m!1435059 () Bool)

(assert (=> b!1558377 m!1435059))

(declare-fun m!1435061 () Bool)

(assert (=> b!1558382 m!1435061))

(declare-fun m!1435063 () Bool)

(assert (=> b!1558378 m!1435063))

(check-sat (not start!133222) tp_is_empty!38439 (not b!1558377) (not b!1558382) (not b!1558381) (not b!1558379) (not b!1558378))
(check-sat)
(get-model)

(declare-fun d!162641 () Bool)

(declare-fun lt!670777 () Int)

(assert (=> d!162641 (>= lt!670777 0)))

(declare-fun e!868144 () Int)

(assert (=> d!162641 (= lt!670777 e!868144)))

(declare-fun c!144097 () Bool)

(assert (=> d!162641 (= c!144097 ((_ is Nil!36334) (t!51064 l!1292)))))

(assert (=> d!162641 (= (ListPrimitiveSize!185 (t!51064 l!1292)) lt!670777)))

(declare-fun b!1558409 () Bool)

(assert (=> b!1558409 (= e!868144 0)))

(declare-fun b!1558410 () Bool)

(assert (=> b!1558410 (= e!868144 (+ 1 (ListPrimitiveSize!185 (t!51064 (t!51064 l!1292)))))))

(assert (= (and d!162641 c!144097) b!1558409))

(assert (= (and d!162641 (not c!144097)) b!1558410))

(declare-fun m!1435077 () Bool)

(assert (=> b!1558410 m!1435077))

(assert (=> b!1558381 d!162641))

(declare-fun d!162645 () Bool)

(declare-fun lt!670778 () Int)

(assert (=> d!162645 (>= lt!670778 0)))

(declare-fun e!868145 () Int)

(assert (=> d!162645 (= lt!670778 e!868145)))

(declare-fun c!144098 () Bool)

(assert (=> d!162645 (= c!144098 ((_ is Nil!36334) l!1292))))

(assert (=> d!162645 (= (ListPrimitiveSize!185 l!1292) lt!670778)))

(declare-fun b!1558411 () Bool)

(assert (=> b!1558411 (= e!868145 0)))

(declare-fun b!1558412 () Bool)

(assert (=> b!1558412 (= e!868145 (+ 1 (ListPrimitiveSize!185 (t!51064 l!1292))))))

(assert (= (and d!162645 c!144098) b!1558411))

(assert (= (and d!162645 (not c!144098)) b!1558412))

(assert (=> b!1558412 m!1435055))

(assert (=> b!1558381 d!162645))

(declare-fun d!162647 () Bool)

(declare-fun res!1065848 () Bool)

(declare-fun e!868154 () Bool)

(assert (=> d!162647 (=> res!1065848 e!868154)))

(assert (=> d!162647 (= res!1065848 (or ((_ is Nil!36334) l!1292) ((_ is Nil!36334) (t!51064 l!1292))))))

(assert (=> d!162647 (= (isStrictlySorted!977 l!1292) e!868154)))

(declare-fun b!1558423 () Bool)

(declare-fun e!868155 () Bool)

(assert (=> b!1558423 (= e!868154 e!868155)))

(declare-fun res!1065849 () Bool)

(assert (=> b!1558423 (=> (not res!1065849) (not e!868155))))

(assert (=> b!1558423 (= res!1065849 (bvslt (_1!12502 (h!37779 l!1292)) (_1!12502 (h!37779 (t!51064 l!1292)))))))

(declare-fun b!1558424 () Bool)

(assert (=> b!1558424 (= e!868155 (isStrictlySorted!977 (t!51064 l!1292)))))

(assert (= (and d!162647 (not res!1065848)) b!1558423))

(assert (= (and b!1558423 res!1065849) b!1558424))

(assert (=> b!1558424 m!1435063))

(assert (=> start!133222 d!162647))

(declare-fun d!162655 () Bool)

(declare-fun res!1065854 () Bool)

(declare-fun e!868160 () Bool)

(assert (=> d!162655 (=> res!1065854 e!868160)))

(assert (=> d!162655 (= res!1065854 (or ((_ is Nil!36334) (t!51064 l!1292)) ((_ is Nil!36334) (t!51064 (t!51064 l!1292)))))))

(assert (=> d!162655 (= (isStrictlySorted!977 (t!51064 l!1292)) e!868160)))

(declare-fun b!1558429 () Bool)

(declare-fun e!868161 () Bool)

(assert (=> b!1558429 (= e!868160 e!868161)))

(declare-fun res!1065855 () Bool)

(assert (=> b!1558429 (=> (not res!1065855) (not e!868161))))

(assert (=> b!1558429 (= res!1065855 (bvslt (_1!12502 (h!37779 (t!51064 l!1292))) (_1!12502 (h!37779 (t!51064 (t!51064 l!1292))))))))

(declare-fun b!1558430 () Bool)

(assert (=> b!1558430 (= e!868161 (isStrictlySorted!977 (t!51064 (t!51064 l!1292))))))

(assert (= (and d!162655 (not res!1065854)) b!1558429))

(assert (= (and b!1558429 res!1065855) b!1558430))

(declare-fun m!1435081 () Bool)

(assert (=> b!1558430 m!1435081))

(assert (=> b!1558378 d!162655))

(declare-fun d!162657 () Bool)

(declare-fun res!1065876 () Bool)

(declare-fun e!868182 () Bool)

(assert (=> d!162657 (=> res!1065876 e!868182)))

(assert (=> d!162657 (= res!1065876 (and ((_ is Cons!36333) (t!51064 l!1292)) (= (_1!12502 (h!37779 (t!51064 l!1292))) otherKey!62)))))

(assert (=> d!162657 (= (containsKey!840 (t!51064 l!1292) otherKey!62) e!868182)))

(declare-fun b!1558449 () Bool)

(declare-fun e!868183 () Bool)

(assert (=> b!1558449 (= e!868182 e!868183)))

(declare-fun res!1065877 () Bool)

(assert (=> b!1558449 (=> (not res!1065877) (not e!868183))))

(assert (=> b!1558449 (= res!1065877 (and (or (not ((_ is Cons!36333) (t!51064 l!1292))) (bvsle (_1!12502 (h!37779 (t!51064 l!1292))) otherKey!62)) ((_ is Cons!36333) (t!51064 l!1292)) (bvslt (_1!12502 (h!37779 (t!51064 l!1292))) otherKey!62)))))

(declare-fun b!1558450 () Bool)

(assert (=> b!1558450 (= e!868183 (containsKey!840 (t!51064 (t!51064 l!1292)) otherKey!62))))

(assert (= (and d!162657 (not res!1065876)) b!1558449))

(assert (= (and b!1558449 res!1065877) b!1558450))

(declare-fun m!1435085 () Bool)

(assert (=> b!1558450 m!1435085))

(assert (=> b!1558377 d!162657))

(declare-fun d!162665 () Bool)

(declare-fun res!1065878 () Bool)

(declare-fun e!868184 () Bool)

(assert (=> d!162665 (=> res!1065878 e!868184)))

(assert (=> d!162665 (= res!1065878 (and ((_ is Cons!36333) l!1292) (= (_1!12502 (h!37779 l!1292)) otherKey!62)))))

(assert (=> d!162665 (= (containsKey!840 l!1292 otherKey!62) e!868184)))

(declare-fun b!1558453 () Bool)

(declare-fun e!868185 () Bool)

(assert (=> b!1558453 (= e!868184 e!868185)))

(declare-fun res!1065879 () Bool)

(assert (=> b!1558453 (=> (not res!1065879) (not e!868185))))

(assert (=> b!1558453 (= res!1065879 (and (or (not ((_ is Cons!36333) l!1292)) (bvsle (_1!12502 (h!37779 l!1292)) otherKey!62)) ((_ is Cons!36333) l!1292) (bvslt (_1!12502 (h!37779 l!1292)) otherKey!62)))))

(declare-fun b!1558454 () Bool)

(assert (=> b!1558454 (= e!868185 (containsKey!840 (t!51064 l!1292) otherKey!62))))

(assert (= (and d!162665 (not res!1065878)) b!1558453))

(assert (= (and b!1558453 res!1065879) b!1558454))

(assert (=> b!1558454 m!1435059))

(assert (=> b!1558382 d!162665))

(declare-fun b!1558465 () Bool)

(declare-fun e!868194 () Bool)

(declare-fun tp!112647 () Bool)

(assert (=> b!1558465 (= e!868194 (and tp_is_empty!38439 tp!112647))))

(assert (=> b!1558379 (= tp!112641 e!868194)))

(assert (= (and b!1558379 ((_ is Cons!36333) (t!51064 l!1292))) b!1558465))

(check-sat (not b!1558424) (not b!1558465) (not b!1558450) (not b!1558412) tp_is_empty!38439 (not b!1558454) (not b!1558430) (not b!1558410))
(check-sat)
